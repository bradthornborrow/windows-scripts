#SingleInstance
SetWorkingDir A_ScriptDir

^!r::Reload

ResizeAndCentre(Width,Height)
{
    MonitorGetWorkArea ,,, &ScreenWidth, &ScreenHeight
    WinRestore "A" 

    If (Width <= 100)
        Width := Integer(ScreenWidth * Width/100)

    If (Height <= 100)
        Height := Integer(ScreenHeight * Height/100)
    
    TargetX := (ScreenWidth/2)-(Width/2) ; Calculate the horizontal target where we'll move the window.
    TargetY := (ScreenHeight/2)-(Height/2) ; Calculate the vertical placement of the window.

    WinMove TargetX, TargetY, Width, Height, "A" 
}

^!c::
{
    WinGetPos ,, &Width, &Height, "A" ; Get the active window's position, used for our calculations.
    ResizeAndCentre(Width,Height)
}

^![::
{
    ResizeAndCentre(80,80)
}

^!]::
{
    ResizeAndCentre(90,90)
}

; Define default media playback keys
^!Left::Send "{Media_Prev}"
^!Down::Send "{Media_Play_Pause}"
^!Right::Send "{Media_Next}"
