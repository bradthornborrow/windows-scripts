;#Warn ; Enable warnings to assist with detecting common errors.
#SingleInstance ; Ensures only one instance of script runs
SendMode "Input" ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_InitialWorkingDir ; Ensures a consistent starting directory.

; Ctrl-Alt-R to force reload of script
^!r::
{
	Reload
}

; Ctrl-Alt-L to lock workstation
^!l::DllCall("LockWorkStation")

; Ctrl-Alt-K to open Windows shutdown dialog
^!k::
{
	Run A_InitialWorkingDir "\shutdown-windows.js"
}

; Ctrl-Alt-C to centre active window
^!c::
{
    WinGetPos ,, &Width, &Height, "A"
    WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
}

; Alternate windows media controls
^!Left::Send "{Media_Prev}"
^!Space::Send "{Media_Play_Pause}"
^!Right::Send "{Media_Next}"

:::tsm::
{
	Send "{RAW}ツ"
}

; Ctrl-Alt-N to open File Explorer
^!n::
{
	Run "explorer.exe"
}