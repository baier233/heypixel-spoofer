#pragma once
#include <string>
namespace heypixel_shit {
	std::wstring get_username();
	inline unsigned short global_factor = 25565;

	inline std::string calculate(const std::string& input, unsigned int factor) {
		std::string result;

		for (char ch : input) {
			if (std::isdigit(ch)) { // 处理数字字符 0-9
				int value = ch - '0'; // 转换为整数
				value = (value + factor) % 10; // 计算新值
				result += (value + '0'); // 转换回字符并添加到结果
			}
			else if (std::islower(ch) && ch >= 'a' && ch <= 'f') { // 处理小写字母 a-f
				int value = ch - 'a'; // 转换为整数
				value = (value + factor) % 6; // 计算新值，范围在 0-5
				result += (value + 'a'); // 转换回字符并添加到结果
			}
			else if (std::isupper(ch) && ch >= 'A' && ch <= 'F') { // 处理大写字母 A-F
				int value = ch - 'A'; // 转换为整数
				value = (value + factor) % 6; // 计算新值，范围在 0-5
				result += (value + 'A'); // 转换回字符并添加到结果
			}
			else {
				result += ch; // 保留不在范围内的字符
			}
		}

		return result;
	}
}