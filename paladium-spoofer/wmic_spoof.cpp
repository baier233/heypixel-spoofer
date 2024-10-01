#include "wmic_spoof.h"
#include "includes.h"
#include "titan_hook.h"
#include "utils.h"

#include <string>
#include <iostream>
#include <codecvt>
#include <sstream>
#include "heypixel_shit.h"


static TitanHook<decltype(&CreateProcessW)>HookCreateProcessW;
static BOOL
WINAPI
hkCreateProcessW(
	_In_opt_ LPCWSTR lpApplicationName,
	_Inout_opt_ LPWSTR lpCommandLine,
	_In_opt_ LPSECURITY_ATTRIBUTES lpProcessAttributes,
	_In_opt_ LPSECURITY_ATTRIBUTES lpThreadAttributes,
	_In_ BOOL bInheritHandles,
	_In_ DWORD dwCreationFlags,
	_In_opt_ LPVOID lpEnvironment,
	_In_opt_ LPCWSTR lpCurrentDirectory,
	_In_ LPSTARTUPINFOW lpStartupInfo,
	_Out_ LPPROCESS_INFORMATION lpProcessInformation
);
void wmic_spoof::initialize()
{
	auto k32 = utils::find_or_load_library("kernel32.dll");
	auto pCreateProcessW = GetProcAddress(k32, "CreateProcessW");
	HookCreateProcessW.InitHook(pCreateProcessW, hkCreateProcessW);
	HookCreateProcessW.SetHook();
}

static std::string read_from_pipe(HANDLE hPipe) {
	DWORD dwRead;
	CHAR chBuf[4096];
	std::string result;
	BOOL bSuccess = FALSE;

	for (;;) {
		bSuccess = ReadFile(hPipe, chBuf, sizeof(chBuf), &dwRead, NULL);
		if (!bSuccess || dwRead == 0) break;

		result.append(chBuf, dwRead);
	}

	return result;
}

static BOOL
WINAPI
hkCreateProcessW(
	_In_opt_ LPCWSTR lpApplicationName,
	_Inout_opt_ LPWSTR lpCommandLine,
	_In_opt_ LPSECURITY_ATTRIBUTES lpProcessAttributes,
	_In_opt_ LPSECURITY_ATTRIBUTES lpThreadAttributes,
	_In_ BOOL bInheritHandles,
	_In_ DWORD dwCreationFlags,
	_In_opt_ LPVOID lpEnvironment,
	_In_opt_ LPCWSTR lpCurrentDirectory,
	_In_ LPSTARTUPINFOW lpStartupInfo,
	_Out_ LPPROCESS_INFORMATION lpProcessInformation
)
{
	auto appName = utils::to_std_string(lpApplicationName);
	auto cmdLine = utils::to_std_string(lpCommandLine);
	utils::trim(cmdLine);
	cmdLine = utils::to_lower_c(cmdLine);
	if (cmdLine == "wmic diskdrive get serialnumber" or cmdLine == "wmic baseboard get serialnumber") {
		HANDLE hReadPipe, hWritePipe;
		SECURITY_ATTRIBUTES sa = { sizeof(SECURITY_ATTRIBUTES), NULL, TRUE };

		if (!CreatePipe(&hReadPipe, &hWritePipe, &sa, 0)) {
			return FALSE;
		}
		if (!SetHandleInformation(hReadPipe, HANDLE_FLAG_INHERIT, 0)) {
			return FALSE;
		}

		STARTUPINFOW si;
		ZeroMemory(&si, sizeof(STARTUPINFOW));
		si.cb = sizeof(STARTUPINFOW);
		si.hStdOutput = hWritePipe;
		si.hStdError = hWritePipe;  // If needed
		si.dwFlags |= STARTF_USESTDHANDLES;

		auto result = HookCreateProcessW.GetOrignalFunc()(lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, &si, lpProcessInformation);

		if (!CloseHandle(hWritePipe)) {
			return FALSE;
		}

		if (!result) {
			CloseHandle(hReadPipe);
			return FALSE;
		}

		WaitForSingleObject(lpProcessInformation->hProcess, INFINITE);

		std::string outputData = read_from_pipe(hReadPipe);
		std::istringstream stream(outputData);
		std::string line;

		std::ostringstream output;
		while (std::getline(stream, line)) {
			if (!utils::contains(line, "SerialNumber")) {
				line = heypixel_shit::calculate(line, heypixel_shit::global_factor);
			}
			output << line << "\n";
		}
		output.flush();
		auto outputHandle = lpStartupInfo->hStdOutput;
		std::string data = output.str();
		DWORD bytesWritten;
		BOOL ok = WriteFile(
			outputHandle,
			data.c_str(),
			data.size(),
			&bytesWritten,
			NULL
		);
		return true;
	}


	if (utils::contains(cmdLine, "wmic"))
	{
		std::cout << "Unresolve wmic stuff detected :" << cmdLine << std::endl;
	}


	return HookCreateProcessW.GetOrignalFunc()(lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation);


}