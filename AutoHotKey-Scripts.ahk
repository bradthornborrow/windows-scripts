; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

RegWrite "0", "REG_DWORD", "HKEY_CURRENT_USER\Control Panel\Personalization\Desktop Slideshow", "LastTickHigh"
RegWrite "0", "REG_DWORD", "HKEY_CURRENT_USER\Control Panel\Personalization\Desktop Slideshow", "LastTickLow"

; Ctrl-Alt-R to force reload of script
^!r::
{
	Send "^s" ; To save a changed script
	Sleep 300 ; give it time to save the script
	Reload
}

; Ctrl-Alt-K to open Windows shutdown dialog
^!k::
{
	Run "shutdown-windows.js"
}

; Ctrl-Alt-L to lock workstation
^!l::
{
	DllCall("LockWorkStation")
}

; Ctrl-Alt-C to centre active window
^!c::
{
	WinGetPos ,,&Width,&Height,"A"
	{
		TargetX := (A_ScreenWidth/2)-(Width/2)
		TargetY := (A_ScreenHeight/2)-(Height/2)-48
	}
	WinMove TargetX,TargetY,,,"A"
}

; Alternate windows media controls
^!Left::Send "{Media_Prev}"
^!Space::Send "{Media_Play_Pause}"
^!Right::Send "{Media_Next}"

:::tsm::ツ

:::tsh::¯\_(ツ)_/¯
