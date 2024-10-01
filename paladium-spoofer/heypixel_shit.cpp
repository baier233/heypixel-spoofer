#include "heypixel_shit.h"
#include <regex>
#include <Windows.h>

std::wstring heypixel_shit::get_username()
{
	auto cmd = std::wstring(GetCommandLineW());

	std::wregex username_regex(L"--username\\s+(\\S+)");
	std::wsmatch match;

	if (std::regex_search(cmd, match, username_regex) && match.size() > 1) {
		std::wstring username = match.str(1);
		return username;
	}
	else {
		return L"Default Value";
	}
}
