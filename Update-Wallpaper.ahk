; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

Wallpapers := [] ; Forces the list to be an array.

WallpaperFolder := "C:\Users\BFT\OneDrive\Wallpaper\Desktop\" ; The location of the wallpapers

Loop Files WallpaperFolder "*" ; wherever you store your wallpapers
{
	Wallpapers.Push(A_LoopFileName)
}

; Sets the wallpaper to a random image in the 'Pictures' folder.
Wallpaper := Wallpapers[Random(1, Wallpapers.Length)]
;TrayTip "Setting '" . Wallpaper . "' as your wallpaper"
SetWallpaper (WallpaperFolder . Wallpaper)

Exit:
	ExitApp 0 ; Exit the script with a code of 0

; Sets the wallpaper to a selected file of your choosing.
SetWallpaper(WallpaperFile) {
	; RegWrite, REG_SZ, HKEY_CURRENT_USER\Control Panel\Desktop, WallPaper, % WallpaperFile
	DllCall("SystemParametersInfo", "UInt", 0x14, "UInt", 0, "Str", WallpaperFile, "UInt", 1)
}