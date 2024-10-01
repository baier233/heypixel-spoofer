#include "mac_spoof.h"
#include "titan_hook.h"
#include "includes.h"
#include "utils.h"
static jbyteArray JNICALL hkGetMacAddr0(JNIEnv* env, jclass caller, jbyteArray addrArray, jstring name, jint index);
TitanHook<decltype(&hkGetMacAddr0)>HookGetMacAddr0;
void mac_spoof::initialize()
{
	auto hNet = utils::find_or_load_library("net.dll");
	auto pGetMacAddr = GetProcAddress(hNet, "Java_java_net_NetworkInterface_getMacAddr0");
	if (!pGetMacAddr)
	{
		throw std::runtime_error("unable to get Java_java_net_NetworkInterface_getMacAddr0 addr");
	}
	HookGetMacAddr0.InitHook(pGetMacAddr, hkGetMacAddr0);
	HookGetMacAddr0.SetHook();
}
#include "heypixel_shit.h"
jbyteArray JNICALL hkGetMacAddr0(JNIEnv* env, jclass caller, jbyteArray addrArray, jstring name, jint index)
{
	auto result = HookGetMacAddr0.GetOrignalFunc()(env, caller, addrArray, name, index);
	if (!result) return result;
	auto size = env->GetArrayLength(result);
	jbyte* buf = new jbyte[size];
	env->GetByteArrayRegion(result, 0, size, buf);
	for (size_t i = 0; i < size; i += 2)
	{
		buf[i] ^= heypixel_shit::global_factor;
	}
	env->SetByteArrayRegion(result, 0, size, buf);
	delete[] buf;
	return result;
}
