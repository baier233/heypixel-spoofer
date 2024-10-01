#include "main.h"
#include <WbemCli.h>
#include <gl/GL.h>

#include "module_hooks.hpp"
#include "wmi_hook.hpp"
#include "detours.h"
#include "wmic_spoof.h"
#include "mac_spoof.h"
#include "heypixel_shit.h"

using namespace std;

static LSTATUS(APIENTRY* orig_RegQueryValueExW)(HKEY, LPCWSTR, LPDWORD, LPDWORD, LPBYTE, LPDWORD) = RegQueryValueExW;
static BOOL(WINAPI* orig_GetVolumeNameForVolumeMountPointW)(LPCWSTR, LPWSTR, DWORD) = GetVolumeNameForVolumeMountPointW;

static std::wstring value;

static void (*orig_nglGetTexImage)(GLenum target, GLint level, GLenum format, GLenum type, GLvoid* pixels);

static void hk_nglGetTexImage(GLenum target, GLint level, GLenum format, GLenum type, GLvoid* pixels) {
	system("msg %username% \"It seems like a screenshot has been taken.\"");
	orig_nglGetTexImage(target, level, format, type, pixels);
}

static LSTATUS APIENTRY hk_RegQueryValueExW(HKEY hKey, LPCWSTR lpValueName, LPDWORD lpReserved, LPDWORD lpType, LPBYTE lpData, LPDWORD lpcbData)
{
	LSTATUS status = orig_RegQueryValueExW(hKey, lpValueName, lpReserved, lpType, lpData, lpcbData);
	std::wstring path = utils::GetRegistryKeyPath(hKey);

	bool flag =
		utils::wstr_starts_with(path, L"\\REGISTRY\\MACHINE\\HARDWARE\\DESCRIPTION\\System\\CentralProcessor\\") ||
		utils::wstr_starts_with(path, L"\\REGISTRY\\MACHINE\\SYSTEM\\ControlSet001\\Control\\Class\\{4d36e96c-e325-11ce-bfc1-08002be10318}\\") ||
		utils::wstr_starts_with(path, L"\\REGISTRY\\MACHINE\\SYSTEM\\ControlSet001\\Enum\\DISPLAY\\");

	if (lpValueName != NULL && lpData && lpcbData && flag)
	{
		if ((*lpType) == REG_SZ) {
			memcpy(lpData, &value.c_str()[0], *lpcbData);
		}

		if ((*lpType) == REG_BINARY) {
			DWORD dwordValue = wcstoul(value.c_str(), nullptr, 10);
			memcpy(lpData, &dwordValue, sizeof(DWORD));
			*lpcbData = sizeof(DWORD);
		}
	}

	return status;
}


static BOOL WINAPI hk_GetVolumeNameForVolumeMountPointW(LPCWSTR lpszVolumeMountPoint, LPWSTR lpszVolumeName, DWORD cchBufferLength)
{
	BOOL success = orig_GetVolumeNameForVolumeMountPointW(lpszVolumeMountPoint, lpszVolumeName, cchBufferLength);
	memcpy(lpszVolumeName, &value.c_str()[0], cchBufferLength);
	return success;
}
DWORD BootStrapThread(HANDLE _) {

	if (std::wstring(GetCommandLine()).find(L"-DToken") == std::wstring::npos)
	{
		return TRUE;
	}


	if (DetourIsHelperProcess()) {
		return TRUE;
	}
	utils::create_console();

	//value = utils::read_file_to_wstr(L"C:\\Users\\Public\\nt.dat");
	value = heypixel_shit::get_username();
	heypixel_shit::global_factor = utils::hash_string(value.c_str());



	DetourTransactionBegin();
	DetourUpdateThread(GetCurrentThread());
	DetourAttach(&(PVOID&)orig_RegQueryValueExW, hk_RegQueryValueExW);
	DetourAttach(&(PVOID&)orig_GetVolumeNameForVolumeMountPointW, hk_GetVolumeNameForVolumeMountPointW);
	wmi_hook::initialize(value);
	//module_hooks::initialize_hooks();
	wmic_spoof::initialize();
	mac_spoof::initialize();
	DetourTransactionCommit();
}
