#SingleInstance
SetWorkingDir A_ScriptDir

^!r::Reload

^!c::
{
    MonitorGetWorkArea ,,, &ScreenWidth, &ScreenHeight
    WinGetPos ,, &Width, &Height, "A" ; Get the active window's position, used for our calculations.

    TargetX := (ScreenWidth/2)-(Width/2) ; Calculate the horizontal target where we'll move the window.
    TargetY := (ScreenHeight/2)-(Height/2) ; Calculate the vertical placement of the window.
 
    WinMove TargetX, TargetY,,, "A" ; Move the window to the calculated coordinates.
}

^![::
{
    MonitorGetWorkArea ,,, &ScreenWidth, &ScreenHeight
    WinRestore "A" 
    Width := 2048
    Height := 1280

    TargetX := (ScreenWidth/2)-(Width/2) ; Calculate the horizontal target where we'll move the window.
    TargetY := (ScreenHeight/2)-(Height/2) ; Calculate the vertical placement of the window.

    WinMove TargetX, TargetY, Width, Height, "A" 
}

^!]::
{
    MonitorGetWorkArea ,,, &ScreenWidth, &ScreenHeight
    WinRestore "A" 
    Width := 2280
    Height := 1360

    TargetX := (ScreenWidth/2)-(Width/2) ; Calculate the horizontal target where we'll move the window.
    TargetY := (ScreenHeight/2)-(Height/2) ; Calculate the vertical placement of the window.

    WinMove TargetX, TargetY, Width, Height, "A" 
}

; Define default media playback keys
^!Left::Send "{Media_Prev}"
^!Down::Send "{Media_Play_Pause}"
^!Right::Send "{Media_Next}"
