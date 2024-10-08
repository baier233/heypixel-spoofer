﻿#include "utils.h"
#include <algorithm>
#include <sstream>
#include <fstream>
#include <string>

#define REG_KEY_PATH_LENGTH 1024

typedef enum _KEY_INFORMATION_CLASS {
	KeyBasicInformation,
	KeyNodeInformation,
	KeyFullInformation,
	KeyNameInformation,
	KeyCachedInformation,
	KeyFlagsInformation,
	KeyVirtualizationInformation,
	KeyHandleTagsInformation,
	KeyTrustInformation,
	KeyLayerInformation,
	MaxKeyInfoClass
} KEY_INFORMATION_CLASS;

typedef struct _KEY_NAME_INFORMATION {
	ULONG NameLength;
	WCHAR Name[1];
} KEY_NAME_INFORMATION, * PKEY_NAME_INFORMATION;

EXTERN_C NTSYSAPI NTSTATUS NTAPI NtQueryKey(
	__in        HANDLE  /* KeyHandle */,
	__in        KEY_INFORMATION_CLASS /* KeyInformationClass */,
	__out_opt   PVOID   /* KeyInformation */,
	__in        ULONG   /* Length */,
	__out       ULONG* /* ResultLength */
);

namespace utils {


	std::wstring to_lower_w(const std::wstring& str) {
		std::wstring lowerStr;
		for (wchar_t ch : str) {
			lowerStr += std::tolower(ch);
		}
		return lowerStr;
	}

	std::string to_lower_c(const std::string& str)
	{

		auto result = std::string(str);
		std::transform(result.begin(), result.end(), result.begin(), [](unsigned char c) -> unsigned char
			{
				return static_cast<unsigned char>(std::tolower(c));
			});

		return result;

	}


	std::wstring GetRegistryKeyPath(HKEY hKey)
	{
		std::wstring keyPath;

		NTSTATUS Status;

		std::vector<UCHAR> Buffer(FIELD_OFFSET(KEY_NAME_INFORMATION, Name) + sizeof(WCHAR) * REG_KEY_PATH_LENGTH);
		KEY_NAME_INFORMATION* pkni;
		ULONG Length;

	TryAgain:
		Status = NtQueryKey(hKey, KeyNameInformation, Buffer.data(), Buffer.size(), &Length);
		switch (Status) {
		case STATUS_BUFFER_TOO_SMALL:
		case STATUS_BUFFER_OVERFLOW:
			Buffer.resize(Length);
			goto TryAgain;
		case STATUS_SUCCESS:
			pkni = reinterpret_cast<KEY_NAME_INFORMATION*>(Buffer.data());
			keyPath.assign(pkni->Name, pkni->NameLength / sizeof(WCHAR));
		default:
			break;
		}

		return keyPath;
	}

	bool wstr_starts_with(const std::wstring& mainStr, const std::wstring& toMatch)
	{
		return mainStr.length() >= toMatch.length() &&
			mainStr.compare(0, toMatch.length(), toMatch) == 0;
	}

	bool ends_with(std::wstring mainStr, std::wstring toMatch)
	{
		auto it = toMatch.begin();
		return mainStr.size() >= toMatch.size() &&
			std::all_of(std::next(mainStr.begin(), mainStr.size() - toMatch.size()), mainStr.end(), [&it](const char& c) {
			return ::tolower(c) == ::tolower(*(it++));
				});
	}

	HMODULE find_or_load_library(LPCSTR str)
	{
		HMODULE handle = GetModuleHandleA(str);
		return handle ? handle : LoadLibraryA(str);
	}

	std::wstring read_file_to_wstr(const std::wstring& file_name) {
		std::wifstream in(file_name);

		if (!in.is_open()) {
			throw std::runtime_error("Unable to open file for reading");
		}

		in >> std::noskipws;
		std::wstringstream wss;
		wss << in.rdbuf();
		in.close();

		return wss.str();
	}

#include <io.h>
#include <fcntl.h>
#include <iostream>
	void create_console()
	{
		FreeConsole();
		if (!AllocConsole())
		{
			char buffer[1024] = { 0 };
			sprintf_s(buffer, "Failed to AllocConsole( ), GetLastError( ) = %d", GetLastError());
			MessageBoxA(HWND_DESKTOP, buffer, "Error", MB_OK);

			return;
		}

		auto lStdHandle = GetStdHandle(STD_OUTPUT_HANDLE);
		auto hConHandle = _open_osfhandle(PtrToUlong(lStdHandle), _O_TEXT);
		auto fp = _fdopen(hConHandle, "w");
		//CONOUT$
		freopen_s(&fp, "CONOUT$", "w", stdout);

		*(__acrt_iob_func(1)) = *fp;
		setvbuf(stdout, NULL, _IONBF, 0);
	}
}