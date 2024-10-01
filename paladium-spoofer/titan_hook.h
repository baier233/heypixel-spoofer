#pragma once
#include <Windows.h>
#include <detours.h>
#pragma comment(lib, "detours.lib")
template <typename T>
class TitanHook {
public:
	void InitHook(void* targetFunc, void* myFunc) {
		targetFunc_ = targetFunc;
		oFunc = targetFunc;
		myFunc_ = myFunc;
	}
	TitanHook() {
		hooked = false;
	}
	void SetHook() {
		if (hooked) return;
		DetourTransactionBegin();
		DetourUpdateThread(GetCurrentThread());
		DetourAttach(&(LPVOID&)targetFunc_, myFunc_);
		DetourTransactionCommit();
		hooked = true;
	}

	T GetOrignalFunc() {
		return (T)targetFunc_;
	}

	void RemoveHook() {
		DetourTransactionBegin();
		DetourUpdateThread(GetCurrentThread());
		DetourDetach(&(LPVOID&)targetFunc_, myFunc_);
		DetourTransactionCommit();
	}

	~TitanHook() {
		RemoveHook();
	}
	void* targetFunc_;
	void* oFunc;
	void* myFunc_;
	bool hooked = false;
private:
};


template <typename T>
class TitanHookVTable {
public:
	inline void InitHook(void* targetObject, void* myFunc, int index) {
		targetObject_ = targetObject;
		myFunc_ = myFunc;
		index_ = index;
	}
	TitanHookVTable() {
	}
	void SetHook() {
		HookVirtualFunction();
	}

	T GetOrignalFunc() {
		return (T)orignalFunc_;
	}

	void RemoveHook() {
		UnHookVirtualFunction();
	}

	~TitanHookVTable() {
		RemoveHook();
	}
private:
	void* targetObject_;
	void* orignalFunc_;
	void* myFunc_;
	int index_;

	void HookVirtualFunction() {
		PVOID* lppVtable = *(VOID***)targetObject_;
		auto lpOriginalFunction = (void*)lppVtable[index_];

		if (lpOriginalFunction != myFunc_)
		{
			orignalFunc_ = lpOriginalFunction;
			DWORD dwOldProtect;
			VirtualProtect(&lppVtable[index_], sizeof(void*), PAGE_EXECUTE_READWRITE, &dwOldProtect);
			lppVtable[index_] = myFunc_;
			//VirtualProtect(&lppVtable[index_], sizeof(void*), dwOldProtect, NULL);
		}

	}

	void UnHookVirtualFunction() {
		PVOID* lppVtable = *(VOID***)targetObject_;
		auto lpOriginalFunction = (void*)lppVtable[index_];

		if (lpOriginalFunction == myFunc_)
		{
			DWORD dwOldProtect;
			VirtualProtect(&lppVtable[index_], sizeof(void*), PAGE_READWRITE, &dwOldProtect);
			lppVtable[index_] = orignalFunc_;
			VirtualProtect(&lppVtable[index_], sizeof(void*), dwOldProtect, NULL);
		}

	}
};