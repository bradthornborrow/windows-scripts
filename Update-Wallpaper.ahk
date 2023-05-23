; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

try if ((pDesktopWallpaper := ComObject("{C2CF3110-460E-4fc1-B9D0-8A1C0C9CC4BD}", "{B92B56A9-8B55-4E14-9A89-0199BBB6F93B}"))) {
	ComCall(16, pDesktopWallpaper, "Ptr", 0, "UInt", 0) ; IDesktopWallpaper::AdvanceSlideshow - https://msdn.microsoft.com/en-us/library/windows/desktop/hh706947(v=vs.85).aspx
	ObjRelease(pDesktopWallpaper)
}

; Force wallpaper refresh on next restart
RegWrite "0", "REG_DWORD", "HKEY_CURRENT_USER\Control Panel\Personalization\Desktop Slideshow", "LastTickHigh"
RegWrite "0", "REG_DWORD", "HKEY_CURRENT_USER\Control Panel\Personalization\Desktop Slideshow", "LastTickLow"