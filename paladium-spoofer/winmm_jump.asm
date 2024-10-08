
;
; created by AheadLib
; github:https://github.com/strivexjun/AheadLib-x86-x64
;
; 把 .asm 文件添加到工程一次
; 右键单击文件-属性-常规-
; 项类型:自定义生成工具
; 从生成中排除:否

; 然后复制下面命令填入
; 命令行: ml64 /Fo $(IntDir)%(fileName).obj /c /Cp %(fileName).asm
; 输出: $(IntDir)%(fileName).obj;%(Outputs)
; 链接对象: 是
;


.DATA
EXTERN pfnAheadLib_Unnamed2:dq;
EXTERN pfnAheadLib_mciExecute:dq;
EXTERN pfnAheadLib_CloseDriver:dq;
EXTERN pfnAheadLib_DefDriverProc:dq;
EXTERN pfnAheadLib_DriverCallback:dq;
EXTERN pfnAheadLib_DrvGetModuleHandle:dq;
EXTERN pfnAheadLib_GetDriverModuleHandle:dq;
EXTERN pfnAheadLib_OpenDriver:dq;
EXTERN pfnAheadLib_PlaySound:dq;
EXTERN pfnAheadLib_PlaySoundA:dq;
EXTERN pfnAheadLib_PlaySoundW:dq;
EXTERN pfnAheadLib_SendDriverMessage:dq;
EXTERN pfnAheadLib_WOWAppExit:dq;
EXTERN pfnAheadLib_auxGetDevCapsA:dq;
EXTERN pfnAheadLib_auxGetDevCapsW:dq;
EXTERN pfnAheadLib_auxGetNumDevs:dq;
EXTERN pfnAheadLib_auxGetVolume:dq;
EXTERN pfnAheadLib_auxOutMessage:dq;
EXTERN pfnAheadLib_auxSetVolume:dq;
EXTERN pfnAheadLib_joyConfigChanged:dq;
EXTERN pfnAheadLib_joyGetDevCapsA:dq;
EXTERN pfnAheadLib_joyGetDevCapsW:dq;
EXTERN pfnAheadLib_joyGetNumDevs:dq;
EXTERN pfnAheadLib_joyGetPos:dq;
EXTERN pfnAheadLib_joyGetPosEx:dq;
EXTERN pfnAheadLib_joyGetThreshold:dq;
EXTERN pfnAheadLib_joyReleaseCapture:dq;
EXTERN pfnAheadLib_joySetCapture:dq;
EXTERN pfnAheadLib_joySetThreshold:dq;
EXTERN pfnAheadLib_mciDriverNotify:dq;
EXTERN pfnAheadLib_mciDriverYield:dq;
EXTERN pfnAheadLib_mciFreeCommandResource:dq;
EXTERN pfnAheadLib_mciGetCreatorTask:dq;
EXTERN pfnAheadLib_mciGetDeviceIDA:dq;
EXTERN pfnAheadLib_mciGetDeviceIDFromElementIDA:dq;
EXTERN pfnAheadLib_mciGetDeviceIDFromElementIDW:dq;
EXTERN pfnAheadLib_mciGetDeviceIDW:dq;
EXTERN pfnAheadLib_mciGetDriverData:dq;
EXTERN pfnAheadLib_mciGetErrorStringA:dq;
EXTERN pfnAheadLib_mciGetErrorStringW:dq;
EXTERN pfnAheadLib_mciGetYieldProc:dq;
EXTERN pfnAheadLib_mciLoadCommandResource:dq;
EXTERN pfnAheadLib_mciSendCommandA:dq;
EXTERN pfnAheadLib_mciSendCommandW:dq;
EXTERN pfnAheadLib_mciSendStringA:dq;
EXTERN pfnAheadLib_mciSendStringW:dq;
EXTERN pfnAheadLib_mciSetDriverData:dq;
EXTERN pfnAheadLib_mciSetYieldProc:dq;
EXTERN pfnAheadLib_midiConnect:dq;
EXTERN pfnAheadLib_midiDisconnect:dq;
EXTERN pfnAheadLib_midiInAddBuffer:dq;
EXTERN pfnAheadLib_midiInClose:dq;
EXTERN pfnAheadLib_midiInGetDevCapsA:dq;
EXTERN pfnAheadLib_midiInGetDevCapsW:dq;
EXTERN pfnAheadLib_midiInGetErrorTextA:dq;
EXTERN pfnAheadLib_midiInGetErrorTextW:dq;
EXTERN pfnAheadLib_midiInGetID:dq;
EXTERN pfnAheadLib_midiInGetNumDevs:dq;
EXTERN pfnAheadLib_midiInMessage:dq;
EXTERN pfnAheadLib_midiInOpen:dq;
EXTERN pfnAheadLib_midiInPrepareHeader:dq;
EXTERN pfnAheadLib_midiInReset:dq;
EXTERN pfnAheadLib_midiInStart:dq;
EXTERN pfnAheadLib_midiInStop:dq;
EXTERN pfnAheadLib_midiInUnprepareHeader:dq;
EXTERN pfnAheadLib_midiOutCacheDrumPatches:dq;
EXTERN pfnAheadLib_midiOutCachePatches:dq;
EXTERN pfnAheadLib_midiOutClose:dq;
EXTERN pfnAheadLib_midiOutGetDevCapsA:dq;
EXTERN pfnAheadLib_midiOutGetDevCapsW:dq;
EXTERN pfnAheadLib_midiOutGetErrorTextA:dq;
EXTERN pfnAheadLib_midiOutGetErrorTextW:dq;
EXTERN pfnAheadLib_midiOutGetID:dq;
EXTERN pfnAheadLib_midiOutGetNumDevs:dq;
EXTERN pfnAheadLib_midiOutGetVolume:dq;
EXTERN pfnAheadLib_midiOutLongMsg:dq;
EXTERN pfnAheadLib_midiOutMessage:dq;
EXTERN pfnAheadLib_midiOutOpen:dq;
EXTERN pfnAheadLib_midiOutPrepareHeader:dq;
EXTERN pfnAheadLib_midiOutReset:dq;
EXTERN pfnAheadLib_midiOutSetVolume:dq;
EXTERN pfnAheadLib_midiOutShortMsg:dq;
EXTERN pfnAheadLib_midiOutUnprepareHeader:dq;
EXTERN pfnAheadLib_midiStreamClose:dq;
EXTERN pfnAheadLib_midiStreamOpen:dq;
EXTERN pfnAheadLib_midiStreamOut:dq;
EXTERN pfnAheadLib_midiStreamPause:dq;
EXTERN pfnAheadLib_midiStreamPosition:dq;
EXTERN pfnAheadLib_midiStreamProperty:dq;
EXTERN pfnAheadLib_midiStreamRestart:dq;
EXTERN pfnAheadLib_midiStreamStop:dq;
EXTERN pfnAheadLib_mixerClose:dq;
EXTERN pfnAheadLib_mixerGetControlDetailsA:dq;
EXTERN pfnAheadLib_mixerGetControlDetailsW:dq;
EXTERN pfnAheadLib_mixerGetDevCapsA:dq;
EXTERN pfnAheadLib_mixerGetDevCapsW:dq;
EXTERN pfnAheadLib_mixerGetID:dq;
EXTERN pfnAheadLib_mixerGetLineControlsA:dq;
EXTERN pfnAheadLib_mixerGetLineControlsW:dq;
EXTERN pfnAheadLib_mixerGetLineInfoA:dq;
EXTERN pfnAheadLib_mixerGetLineInfoW:dq;
EXTERN pfnAheadLib_mixerGetNumDevs:dq;
EXTERN pfnAheadLib_mixerMessage:dq;
EXTERN pfnAheadLib_mixerOpen:dq;
EXTERN pfnAheadLib_mixerSetControlDetails:dq;
EXTERN pfnAheadLib_mmDrvInstall:dq;
EXTERN pfnAheadLib_mmGetCurrentTask:dq;
EXTERN pfnAheadLib_mmTaskBlock:dq;
EXTERN pfnAheadLib_mmTaskCreate:dq;
EXTERN pfnAheadLib_mmTaskSignal:dq;
EXTERN pfnAheadLib_mmTaskYield:dq;
EXTERN pfnAheadLib_mmioAdvance:dq;
EXTERN pfnAheadLib_mmioAscend:dq;
EXTERN pfnAheadLib_mmioClose:dq;
EXTERN pfnAheadLib_mmioCreateChunk:dq;
EXTERN pfnAheadLib_mmioDescend:dq;
EXTERN pfnAheadLib_mmioFlush:dq;
EXTERN pfnAheadLib_mmioGetInfo:dq;
EXTERN pfnAheadLib_mmioInstallIOProcA:dq;
EXTERN pfnAheadLib_mmioInstallIOProcW:dq;
EXTERN pfnAheadLib_mmioOpenA:dq;
EXTERN pfnAheadLib_mmioOpenW:dq;
EXTERN pfnAheadLib_mmioRead:dq;
EXTERN pfnAheadLib_mmioRenameA:dq;
EXTERN pfnAheadLib_mmioRenameW:dq;
EXTERN pfnAheadLib_mmioSeek:dq;
EXTERN pfnAheadLib_mmioSendMessage:dq;
EXTERN pfnAheadLib_mmioSetBuffer:dq;
EXTERN pfnAheadLib_mmioSetInfo:dq;
EXTERN pfnAheadLib_mmioStringToFOURCCA:dq;
EXTERN pfnAheadLib_mmioStringToFOURCCW:dq;
EXTERN pfnAheadLib_mmioWrite:dq;
EXTERN pfnAheadLib_mmsystemGetVersion:dq;
EXTERN pfnAheadLib_sndPlaySoundA:dq;
EXTERN pfnAheadLib_sndPlaySoundW:dq;
EXTERN pfnAheadLib_timeBeginPeriod:dq;
EXTERN pfnAheadLib_timeEndPeriod:dq;
EXTERN pfnAheadLib_timeGetDevCaps:dq;
EXTERN pfnAheadLib_timeGetSystemTime:dq;
EXTERN pfnAheadLib_timeGetTime:dq;
EXTERN pfnAheadLib_timeKillEvent:dq;
EXTERN pfnAheadLib_timeSetEvent:dq;
EXTERN pfnAheadLib_waveInAddBuffer:dq;
EXTERN pfnAheadLib_waveInClose:dq;
EXTERN pfnAheadLib_waveInGetDevCapsA:dq;
EXTERN pfnAheadLib_waveInGetDevCapsW:dq;
EXTERN pfnAheadLib_waveInGetErrorTextA:dq;
EXTERN pfnAheadLib_waveInGetErrorTextW:dq;
EXTERN pfnAheadLib_waveInGetID:dq;
EXTERN pfnAheadLib_waveInGetNumDevs:dq;
EXTERN pfnAheadLib_waveInGetPosition:dq;
EXTERN pfnAheadLib_waveInMessage:dq;
EXTERN pfnAheadLib_waveInOpen:dq;
EXTERN pfnAheadLib_waveInPrepareHeader:dq;
EXTERN pfnAheadLib_waveInReset:dq;
EXTERN pfnAheadLib_waveInStart:dq;
EXTERN pfnAheadLib_waveInStop:dq;
EXTERN pfnAheadLib_waveInUnprepareHeader:dq;
EXTERN pfnAheadLib_waveOutBreakLoop:dq;
EXTERN pfnAheadLib_waveOutClose:dq;
EXTERN pfnAheadLib_waveOutGetDevCapsA:dq;
EXTERN pfnAheadLib_waveOutGetDevCapsW:dq;
EXTERN pfnAheadLib_waveOutGetErrorTextA:dq;
EXTERN pfnAheadLib_waveOutGetErrorTextW:dq;
EXTERN pfnAheadLib_waveOutGetID:dq;
EXTERN pfnAheadLib_waveOutGetNumDevs:dq;
EXTERN pfnAheadLib_waveOutGetPitch:dq;
EXTERN pfnAheadLib_waveOutGetPlaybackRate:dq;
EXTERN pfnAheadLib_waveOutGetPosition:dq;
EXTERN pfnAheadLib_waveOutGetVolume:dq;
EXTERN pfnAheadLib_waveOutMessage:dq;
EXTERN pfnAheadLib_waveOutOpen:dq;
EXTERN pfnAheadLib_waveOutPause:dq;
EXTERN pfnAheadLib_waveOutPrepareHeader:dq;
EXTERN pfnAheadLib_waveOutReset:dq;
EXTERN pfnAheadLib_waveOutRestart:dq;
EXTERN pfnAheadLib_waveOutSetPitch:dq;
EXTERN pfnAheadLib_waveOutSetPlaybackRate:dq;
EXTERN pfnAheadLib_waveOutSetVolume:dq;
EXTERN pfnAheadLib_waveOutUnprepareHeader:dq;
EXTERN pfnAheadLib_waveOutWrite:dq;

.CODE
AheadLib_Unnamed2 PROC
	jmp pfnAheadLib_Unnamed2
AheadLib_Unnamed2 ENDP

AheadLib_mciExecute PROC
	jmp pfnAheadLib_mciExecute
AheadLib_mciExecute ENDP

AheadLib_CloseDriver PROC
	jmp pfnAheadLib_CloseDriver
AheadLib_CloseDriver ENDP

AheadLib_DefDriverProc PROC
	jmp pfnAheadLib_DefDriverProc
AheadLib_DefDriverProc ENDP

AheadLib_DriverCallback PROC
	jmp pfnAheadLib_DriverCallback
AheadLib_DriverCallback ENDP

AheadLib_DrvGetModuleHandle PROC
	jmp pfnAheadLib_DrvGetModuleHandle
AheadLib_DrvGetModuleHandle ENDP

AheadLib_GetDriverModuleHandle PROC
	jmp pfnAheadLib_GetDriverModuleHandle
AheadLib_GetDriverModuleHandle ENDP

AheadLib_OpenDriver PROC
	jmp pfnAheadLib_OpenDriver
AheadLib_OpenDriver ENDP

AheadLib_PlaySound PROC
	jmp pfnAheadLib_PlaySound
AheadLib_PlaySound ENDP

AheadLib_PlaySoundA PROC
	jmp pfnAheadLib_PlaySoundA
AheadLib_PlaySoundA ENDP

AheadLib_PlaySoundW PROC
	jmp pfnAheadLib_PlaySoundW
AheadLib_PlaySoundW ENDP

AheadLib_SendDriverMessage PROC
	jmp pfnAheadLib_SendDriverMessage
AheadLib_SendDriverMessage ENDP

AheadLib_WOWAppExit PROC
	jmp pfnAheadLib_WOWAppExit
AheadLib_WOWAppExit ENDP

AheadLib_auxGetDevCapsA PROC
	jmp pfnAheadLib_auxGetDevCapsA
AheadLib_auxGetDevCapsA ENDP

AheadLib_auxGetDevCapsW PROC
	jmp pfnAheadLib_auxGetDevCapsW
AheadLib_auxGetDevCapsW ENDP

AheadLib_auxGetNumDevs PROC
	jmp pfnAheadLib_auxGetNumDevs
AheadLib_auxGetNumDevs ENDP

AheadLib_auxGetVolume PROC
	jmp pfnAheadLib_auxGetVolume
AheadLib_auxGetVolume ENDP

AheadLib_auxOutMessage PROC
	jmp pfnAheadLib_auxOutMessage
AheadLib_auxOutMessage ENDP

AheadLib_auxSetVolume PROC
	jmp pfnAheadLib_auxSetVolume
AheadLib_auxSetVolume ENDP

AheadLib_joyConfigChanged PROC
	jmp pfnAheadLib_joyConfigChanged
AheadLib_joyConfigChanged ENDP

AheadLib_joyGetDevCapsA PROC
	jmp pfnAheadLib_joyGetDevCapsA
AheadLib_joyGetDevCapsA ENDP

AheadLib_joyGetDevCapsW PROC
	jmp pfnAheadLib_joyGetDevCapsW
AheadLib_joyGetDevCapsW ENDP

AheadLib_joyGetNumDevs PROC
	jmp pfnAheadLib_joyGetNumDevs
AheadLib_joyGetNumDevs ENDP

AheadLib_joyGetPos PROC
	jmp pfnAheadLib_joyGetPos
AheadLib_joyGetPos ENDP

AheadLib_joyGetPosEx PROC
	jmp pfnAheadLib_joyGetPosEx
AheadLib_joyGetPosEx ENDP

AheadLib_joyGetThreshold PROC
	jmp pfnAheadLib_joyGetThreshold
AheadLib_joyGetThreshold ENDP

AheadLib_joyReleaseCapture PROC
	jmp pfnAheadLib_joyReleaseCapture
AheadLib_joyReleaseCapture ENDP

AheadLib_joySetCapture PROC
	jmp pfnAheadLib_joySetCapture
AheadLib_joySetCapture ENDP

AheadLib_joySetThreshold PROC
	jmp pfnAheadLib_joySetThreshold
AheadLib_joySetThreshold ENDP

AheadLib_mciDriverNotify PROC
	jmp pfnAheadLib_mciDriverNotify
AheadLib_mciDriverNotify ENDP

AheadLib_mciDriverYield PROC
	jmp pfnAheadLib_mciDriverYield
AheadLib_mciDriverYield ENDP

AheadLib_mciFreeCommandResource PROC
	jmp pfnAheadLib_mciFreeCommandResource
AheadLib_mciFreeCommandResource ENDP

AheadLib_mciGetCreatorTask PROC
	jmp pfnAheadLib_mciGetCreatorTask
AheadLib_mciGetCreatorTask ENDP

AheadLib_mciGetDeviceIDA PROC
	jmp pfnAheadLib_mciGetDeviceIDA
AheadLib_mciGetDeviceIDA ENDP

AheadLib_mciGetDeviceIDFromElementIDA PROC
	jmp pfnAheadLib_mciGetDeviceIDFromElementIDA
AheadLib_mciGetDeviceIDFromElementIDA ENDP

AheadLib_mciGetDeviceIDFromElementIDW PROC
	jmp pfnAheadLib_mciGetDeviceIDFromElementIDW
AheadLib_mciGetDeviceIDFromElementIDW ENDP

AheadLib_mciGetDeviceIDW PROC
	jmp pfnAheadLib_mciGetDeviceIDW
AheadLib_mciGetDeviceIDW ENDP

AheadLib_mciGetDriverData PROC
	jmp pfnAheadLib_mciGetDriverData
AheadLib_mciGetDriverData ENDP

AheadLib_mciGetErrorStringA PROC
	jmp pfnAheadLib_mciGetErrorStringA
AheadLib_mciGetErrorStringA ENDP

AheadLib_mciGetErrorStringW PROC
	jmp pfnAheadLib_mciGetErrorStringW
AheadLib_mciGetErrorStringW ENDP

AheadLib_mciGetYieldProc PROC
	jmp pfnAheadLib_mciGetYieldProc
AheadLib_mciGetYieldProc ENDP

AheadLib_mciLoadCommandResource PROC
	jmp pfnAheadLib_mciLoadCommandResource
AheadLib_mciLoadCommandResource ENDP

AheadLib_mciSendCommandA PROC
	jmp pfnAheadLib_mciSendCommandA
AheadLib_mciSendCommandA ENDP

AheadLib_mciSendCommandW PROC
	jmp pfnAheadLib_mciSendCommandW
AheadLib_mciSendCommandW ENDP

AheadLib_mciSendStringA PROC
	jmp pfnAheadLib_mciSendStringA
AheadLib_mciSendStringA ENDP

AheadLib_mciSendStringW PROC
	jmp pfnAheadLib_mciSendStringW
AheadLib_mciSendStringW ENDP

AheadLib_mciSetDriverData PROC
	jmp pfnAheadLib_mciSetDriverData
AheadLib_mciSetDriverData ENDP

AheadLib_mciSetYieldProc PROC
	jmp pfnAheadLib_mciSetYieldProc
AheadLib_mciSetYieldProc ENDP

AheadLib_midiConnect PROC
	jmp pfnAheadLib_midiConnect
AheadLib_midiConnect ENDP

AheadLib_midiDisconnect PROC
	jmp pfnAheadLib_midiDisconnect
AheadLib_midiDisconnect ENDP

AheadLib_midiInAddBuffer PROC
	jmp pfnAheadLib_midiInAddBuffer
AheadLib_midiInAddBuffer ENDP

AheadLib_midiInClose PROC
	jmp pfnAheadLib_midiInClose
AheadLib_midiInClose ENDP

AheadLib_midiInGetDevCapsA PROC
	jmp pfnAheadLib_midiInGetDevCapsA
AheadLib_midiInGetDevCapsA ENDP

AheadLib_midiInGetDevCapsW PROC
	jmp pfnAheadLib_midiInGetDevCapsW
AheadLib_midiInGetDevCapsW ENDP

AheadLib_midiInGetErrorTextA PROC
	jmp pfnAheadLib_midiInGetErrorTextA
AheadLib_midiInGetErrorTextA ENDP

AheadLib_midiInGetErrorTextW PROC
	jmp pfnAheadLib_midiInGetErrorTextW
AheadLib_midiInGetErrorTextW ENDP

AheadLib_midiInGetID PROC
	jmp pfnAheadLib_midiInGetID
AheadLib_midiInGetID ENDP

AheadLib_midiInGetNumDevs PROC
	jmp pfnAheadLib_midiInGetNumDevs
AheadLib_midiInGetNumDevs ENDP

AheadLib_midiInMessage PROC
	jmp pfnAheadLib_midiInMessage
AheadLib_midiInMessage ENDP

AheadLib_midiInOpen PROC
	jmp pfnAheadLib_midiInOpen
AheadLib_midiInOpen ENDP

AheadLib_midiInPrepareHeader PROC
	jmp pfnAheadLib_midiInPrepareHeader
AheadLib_midiInPrepareHeader ENDP

AheadLib_midiInReset PROC
	jmp pfnAheadLib_midiInReset
AheadLib_midiInReset ENDP

AheadLib_midiInStart PROC
	jmp pfnAheadLib_midiInStart
AheadLib_midiInStart ENDP

AheadLib_midiInStop PROC
	jmp pfnAheadLib_midiInStop
AheadLib_midiInStop ENDP

AheadLib_midiInUnprepareHeader PROC
	jmp pfnAheadLib_midiInUnprepareHeader
AheadLib_midiInUnprepareHeader ENDP

AheadLib_midiOutCacheDrumPatches PROC
	jmp pfnAheadLib_midiOutCacheDrumPatches
AheadLib_midiOutCacheDrumPatches ENDP

AheadLib_midiOutCachePatches PROC
	jmp pfnAheadLib_midiOutCachePatches
AheadLib_midiOutCachePatches ENDP

AheadLib_midiOutClose PROC
	jmp pfnAheadLib_midiOutClose
AheadLib_midiOutClose ENDP

AheadLib_midiOutGetDevCapsA PROC
	jmp pfnAheadLib_midiOutGetDevCapsA
AheadLib_midiOutGetDevCapsA ENDP

AheadLib_midiOutGetDevCapsW PROC
	jmp pfnAheadLib_midiOutGetDevCapsW
AheadLib_midiOutGetDevCapsW ENDP

AheadLib_midiOutGetErrorTextA PROC
	jmp pfnAheadLib_midiOutGetErrorTextA
AheadLib_midiOutGetErrorTextA ENDP

AheadLib_midiOutGetErrorTextW PROC
	jmp pfnAheadLib_midiOutGetErrorTextW
AheadLib_midiOutGetErrorTextW ENDP

AheadLib_midiOutGetID PROC
	jmp pfnAheadLib_midiOutGetID
AheadLib_midiOutGetID ENDP

AheadLib_midiOutGetNumDevs PROC
	jmp pfnAheadLib_midiOutGetNumDevs
AheadLib_midiOutGetNumDevs ENDP

AheadLib_midiOutGetVolume PROC
	jmp pfnAheadLib_midiOutGetVolume
AheadLib_midiOutGetVolume ENDP

AheadLib_midiOutLongMsg PROC
	jmp pfnAheadLib_midiOutLongMsg
AheadLib_midiOutLongMsg ENDP

AheadLib_midiOutMessage PROC
	jmp pfnAheadLib_midiOutMessage
AheadLib_midiOutMessage ENDP

AheadLib_midiOutOpen PROC
	jmp pfnAheadLib_midiOutOpen
AheadLib_midiOutOpen ENDP

AheadLib_midiOutPrepareHeader PROC
	jmp pfnAheadLib_midiOutPrepareHeader
AheadLib_midiOutPrepareHeader ENDP

AheadLib_midiOutReset PROC
	jmp pfnAheadLib_midiOutReset
AheadLib_midiOutReset ENDP

AheadLib_midiOutSetVolume PROC
	jmp pfnAheadLib_midiOutSetVolume
AheadLib_midiOutSetVolume ENDP

AheadLib_midiOutShortMsg PROC
	jmp pfnAheadLib_midiOutShortMsg
AheadLib_midiOutShortMsg ENDP

AheadLib_midiOutUnprepareHeader PROC
	jmp pfnAheadLib_midiOutUnprepareHeader
AheadLib_midiOutUnprepareHeader ENDP

AheadLib_midiStreamClose PROC
	jmp pfnAheadLib_midiStreamClose
AheadLib_midiStreamClose ENDP

AheadLib_midiStreamOpen PROC
	jmp pfnAheadLib_midiStreamOpen
AheadLib_midiStreamOpen ENDP

AheadLib_midiStreamOut PROC
	jmp pfnAheadLib_midiStreamOut
AheadLib_midiStreamOut ENDP

AheadLib_midiStreamPause PROC
	jmp pfnAheadLib_midiStreamPause
AheadLib_midiStreamPause ENDP

AheadLib_midiStreamPosition PROC
	jmp pfnAheadLib_midiStreamPosition
AheadLib_midiStreamPosition ENDP

AheadLib_midiStreamProperty PROC
	jmp pfnAheadLib_midiStreamProperty
AheadLib_midiStreamProperty ENDP

AheadLib_midiStreamRestart PROC
	jmp pfnAheadLib_midiStreamRestart
AheadLib_midiStreamRestart ENDP

AheadLib_midiStreamStop PROC
	jmp pfnAheadLib_midiStreamStop
AheadLib_midiStreamStop ENDP

AheadLib_mixerClose PROC
	jmp pfnAheadLib_mixerClose
AheadLib_mixerClose ENDP

AheadLib_mixerGetControlDetailsA PROC
	jmp pfnAheadLib_mixerGetControlDetailsA
AheadLib_mixerGetControlDetailsA ENDP

AheadLib_mixerGetControlDetailsW PROC
	jmp pfnAheadLib_mixerGetControlDetailsW
AheadLib_mixerGetControlDetailsW ENDP

AheadLib_mixerGetDevCapsA PROC
	jmp pfnAheadLib_mixerGetDevCapsA
AheadLib_mixerGetDevCapsA ENDP

AheadLib_mixerGetDevCapsW PROC
	jmp pfnAheadLib_mixerGetDevCapsW
AheadLib_mixerGetDevCapsW ENDP

AheadLib_mixerGetID PROC
	jmp pfnAheadLib_mixerGetID
AheadLib_mixerGetID ENDP

AheadLib_mixerGetLineControlsA PROC
	jmp pfnAheadLib_mixerGetLineControlsA
AheadLib_mixerGetLineControlsA ENDP

AheadLib_mixerGetLineControlsW PROC
	jmp pfnAheadLib_mixerGetLineControlsW
AheadLib_mixerGetLineControlsW ENDP

AheadLib_mixerGetLineInfoA PROC
	jmp pfnAheadLib_mixerGetLineInfoA
AheadLib_mixerGetLineInfoA ENDP

AheadLib_mixerGetLineInfoW PROC
	jmp pfnAheadLib_mixerGetLineInfoW
AheadLib_mixerGetLineInfoW ENDP

AheadLib_mixerGetNumDevs PROC
	jmp pfnAheadLib_mixerGetNumDevs
AheadLib_mixerGetNumDevs ENDP

AheadLib_mixerMessage PROC
	jmp pfnAheadLib_mixerMessage
AheadLib_mixerMessage ENDP

AheadLib_mixerOpen PROC
	jmp pfnAheadLib_mixerOpen
AheadLib_mixerOpen ENDP

AheadLib_mixerSetControlDetails PROC
	jmp pfnAheadLib_mixerSetControlDetails
AheadLib_mixerSetControlDetails ENDP

AheadLib_mmDrvInstall PROC
	jmp pfnAheadLib_mmDrvInstall
AheadLib_mmDrvInstall ENDP

AheadLib_mmGetCurrentTask PROC
	jmp pfnAheadLib_mmGetCurrentTask
AheadLib_mmGetCurrentTask ENDP

AheadLib_mmTaskBlock PROC
	jmp pfnAheadLib_mmTaskBlock
AheadLib_mmTaskBlock ENDP

AheadLib_mmTaskCreate PROC
	jmp pfnAheadLib_mmTaskCreate
AheadLib_mmTaskCreate ENDP

AheadLib_mmTaskSignal PROC
	jmp pfnAheadLib_mmTaskSignal
AheadLib_mmTaskSignal ENDP

AheadLib_mmTaskYield PROC
	jmp pfnAheadLib_mmTaskYield
AheadLib_mmTaskYield ENDP

AheadLib_mmioAdvance PROC
	jmp pfnAheadLib_mmioAdvance
AheadLib_mmioAdvance ENDP

AheadLib_mmioAscend PROC
	jmp pfnAheadLib_mmioAscend
AheadLib_mmioAscend ENDP

AheadLib_mmioClose PROC
	jmp pfnAheadLib_mmioClose
AheadLib_mmioClose ENDP

AheadLib_mmioCreateChunk PROC
	jmp pfnAheadLib_mmioCreateChunk
AheadLib_mmioCreateChunk ENDP

AheadLib_mmioDescend PROC
	jmp pfnAheadLib_mmioDescend
AheadLib_mmioDescend ENDP

AheadLib_mmioFlush PROC
	jmp pfnAheadLib_mmioFlush
AheadLib_mmioFlush ENDP

AheadLib_mmioGetInfo PROC
	jmp pfnAheadLib_mmioGetInfo
AheadLib_mmioGetInfo ENDP

AheadLib_mmioInstallIOProcA PROC
	jmp pfnAheadLib_mmioInstallIOProcA
AheadLib_mmioInstallIOProcA ENDP

AheadLib_mmioInstallIOProcW PROC
	jmp pfnAheadLib_mmioInstallIOProcW
AheadLib_mmioInstallIOProcW ENDP

AheadLib_mmioOpenA PROC
	jmp pfnAheadLib_mmioOpenA
AheadLib_mmioOpenA ENDP

AheadLib_mmioOpenW PROC
	jmp pfnAheadLib_mmioOpenW
AheadLib_mmioOpenW ENDP

AheadLib_mmioRead PROC
	jmp pfnAheadLib_mmioRead
AheadLib_mmioRead ENDP

AheadLib_mmioRenameA PROC
	jmp pfnAheadLib_mmioRenameA
AheadLib_mmioRenameA ENDP

AheadLib_mmioRenameW PROC
	jmp pfnAheadLib_mmioRenameW
AheadLib_mmioRenameW ENDP

AheadLib_mmioSeek PROC
	jmp pfnAheadLib_mmioSeek
AheadLib_mmioSeek ENDP

AheadLib_mmioSendMessage PROC
	jmp pfnAheadLib_mmioSendMessage
AheadLib_mmioSendMessage ENDP

AheadLib_mmioSetBuffer PROC
	jmp pfnAheadLib_mmioSetBuffer
AheadLib_mmioSetBuffer ENDP

AheadLib_mmioSetInfo PROC
	jmp pfnAheadLib_mmioSetInfo
AheadLib_mmioSetInfo ENDP

AheadLib_mmioStringToFOURCCA PROC
	jmp pfnAheadLib_mmioStringToFOURCCA
AheadLib_mmioStringToFOURCCA ENDP

AheadLib_mmioStringToFOURCCW PROC
	jmp pfnAheadLib_mmioStringToFOURCCW
AheadLib_mmioStringToFOURCCW ENDP

AheadLib_mmioWrite PROC
	jmp pfnAheadLib_mmioWrite
AheadLib_mmioWrite ENDP

AheadLib_mmsystemGetVersion PROC
	jmp pfnAheadLib_mmsystemGetVersion
AheadLib_mmsystemGetVersion ENDP

AheadLib_sndPlaySoundA PROC
	jmp pfnAheadLib_sndPlaySoundA
AheadLib_sndPlaySoundA ENDP

AheadLib_sndPlaySoundW PROC
	jmp pfnAheadLib_sndPlaySoundW
AheadLib_sndPlaySoundW ENDP

AheadLib_timeBeginPeriod PROC
	jmp pfnAheadLib_timeBeginPeriod
AheadLib_timeBeginPeriod ENDP

AheadLib_timeEndPeriod PROC
	jmp pfnAheadLib_timeEndPeriod
AheadLib_timeEndPeriod ENDP

AheadLib_timeGetDevCaps PROC
	jmp pfnAheadLib_timeGetDevCaps
AheadLib_timeGetDevCaps ENDP

AheadLib_timeGetSystemTime PROC
	jmp pfnAheadLib_timeGetSystemTime
AheadLib_timeGetSystemTime ENDP

AheadLib_timeGetTime PROC
	jmp pfnAheadLib_timeGetTime
AheadLib_timeGetTime ENDP

AheadLib_timeKillEvent PROC
	jmp pfnAheadLib_timeKillEvent
AheadLib_timeKillEvent ENDP

AheadLib_timeSetEvent PROC
	jmp pfnAheadLib_timeSetEvent
AheadLib_timeSetEvent ENDP

AheadLib_waveInAddBuffer PROC
	jmp pfnAheadLib_waveInAddBuffer
AheadLib_waveInAddBuffer ENDP

AheadLib_waveInClose PROC
	jmp pfnAheadLib_waveInClose
AheadLib_waveInClose ENDP

AheadLib_waveInGetDevCapsA PROC
	jmp pfnAheadLib_waveInGetDevCapsA
AheadLib_waveInGetDevCapsA ENDP

AheadLib_waveInGetDevCapsW PROC
	jmp pfnAheadLib_waveInGetDevCapsW
AheadLib_waveInGetDevCapsW ENDP

AheadLib_waveInGetErrorTextA PROC
	jmp pfnAheadLib_waveInGetErrorTextA
AheadLib_waveInGetErrorTextA ENDP

AheadLib_waveInGetErrorTextW PROC
	jmp pfnAheadLib_waveInGetErrorTextW
AheadLib_waveInGetErrorTextW ENDP

AheadLib_waveInGetID PROC
	jmp pfnAheadLib_waveInGetID
AheadLib_waveInGetID ENDP

AheadLib_waveInGetNumDevs PROC
	jmp pfnAheadLib_waveInGetNumDevs
AheadLib_waveInGetNumDevs ENDP

AheadLib_waveInGetPosition PROC
	jmp pfnAheadLib_waveInGetPosition
AheadLib_waveInGetPosition ENDP

AheadLib_waveInMessage PROC
	jmp pfnAheadLib_waveInMessage
AheadLib_waveInMessage ENDP

AheadLib_waveInOpen PROC
	jmp pfnAheadLib_waveInOpen
AheadLib_waveInOpen ENDP

AheadLib_waveInPrepareHeader PROC
	jmp pfnAheadLib_waveInPrepareHeader
AheadLib_waveInPrepareHeader ENDP

AheadLib_waveInReset PROC
	jmp pfnAheadLib_waveInReset
AheadLib_waveInReset ENDP

AheadLib_waveInStart PROC
	jmp pfnAheadLib_waveInStart
AheadLib_waveInStart ENDP

AheadLib_waveInStop PROC
	jmp pfnAheadLib_waveInStop
AheadLib_waveInStop ENDP

AheadLib_waveInUnprepareHeader PROC
	jmp pfnAheadLib_waveInUnprepareHeader
AheadLib_waveInUnprepareHeader ENDP

AheadLib_waveOutBreakLoop PROC
	jmp pfnAheadLib_waveOutBreakLoop
AheadLib_waveOutBreakLoop ENDP

AheadLib_waveOutClose PROC
	jmp pfnAheadLib_waveOutClose
AheadLib_waveOutClose ENDP

AheadLib_waveOutGetDevCapsA PROC
	jmp pfnAheadLib_waveOutGetDevCapsA
AheadLib_waveOutGetDevCapsA ENDP

AheadLib_waveOutGetDevCapsW PROC
	jmp pfnAheadLib_waveOutGetDevCapsW
AheadLib_waveOutGetDevCapsW ENDP

AheadLib_waveOutGetErrorTextA PROC
	jmp pfnAheadLib_waveOutGetErrorTextA
AheadLib_waveOutGetErrorTextA ENDP

AheadLib_waveOutGetErrorTextW PROC
	jmp pfnAheadLib_waveOutGetErrorTextW
AheadLib_waveOutGetErrorTextW ENDP

AheadLib_waveOutGetID PROC
	jmp pfnAheadLib_waveOutGetID
AheadLib_waveOutGetID ENDP

AheadLib_waveOutGetNumDevs PROC
	jmp pfnAheadLib_waveOutGetNumDevs
AheadLib_waveOutGetNumDevs ENDP

AheadLib_waveOutGetPitch PROC
	jmp pfnAheadLib_waveOutGetPitch
AheadLib_waveOutGetPitch ENDP

AheadLib_waveOutGetPlaybackRate PROC
	jmp pfnAheadLib_waveOutGetPlaybackRate
AheadLib_waveOutGetPlaybackRate ENDP

AheadLib_waveOutGetPosition PROC
	jmp pfnAheadLib_waveOutGetPosition
AheadLib_waveOutGetPosition ENDP

AheadLib_waveOutGetVolume PROC
	jmp pfnAheadLib_waveOutGetVolume
AheadLib_waveOutGetVolume ENDP

AheadLib_waveOutMessage PROC
	jmp pfnAheadLib_waveOutMessage
AheadLib_waveOutMessage ENDP

AheadLib_waveOutOpen PROC
	jmp pfnAheadLib_waveOutOpen
AheadLib_waveOutOpen ENDP

AheadLib_waveOutPause PROC
	jmp pfnAheadLib_waveOutPause
AheadLib_waveOutPause ENDP

AheadLib_waveOutPrepareHeader PROC
	jmp pfnAheadLib_waveOutPrepareHeader
AheadLib_waveOutPrepareHeader ENDP

AheadLib_waveOutReset PROC
	jmp pfnAheadLib_waveOutReset
AheadLib_waveOutReset ENDP

AheadLib_waveOutRestart PROC
	jmp pfnAheadLib_waveOutRestart
AheadLib_waveOutRestart ENDP

AheadLib_waveOutSetPitch PROC
	jmp pfnAheadLib_waveOutSetPitch
AheadLib_waveOutSetPitch ENDP

AheadLib_waveOutSetPlaybackRate PROC
	jmp pfnAheadLib_waveOutSetPlaybackRate
AheadLib_waveOutSetPlaybackRate ENDP

AheadLib_waveOutSetVolume PROC
	jmp pfnAheadLib_waveOutSetVolume
AheadLib_waveOutSetVolume ENDP

AheadLib_waveOutUnprepareHeader PROC
	jmp pfnAheadLib_waveOutUnprepareHeader
AheadLib_waveOutUnprepareHeader ENDP

AheadLib_waveOutWrite PROC
	jmp pfnAheadLib_waveOutWrite
AheadLib_waveOutWrite ENDP


END
