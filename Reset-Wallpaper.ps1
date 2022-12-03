param(
    [switch] $Force
)

# Reset Windowns wallpaper slideshow timer
New-ItemProperty -Path "HKCU:\Control Panel\Personalization\Desktop Slideshow" -Name LastTickHigh -PropertyType DWord -Value 0 -Force
New-ItemProperty -Path "HKCU:\Control Panel\Personalization\Desktop Slideshow" -Name LastTickLow -PropertyType DWord -Value 0 -Force

# Restart Explorer if -force switch is present
if ($Force.IsPresent)
{
    Stop-process -name explorer
}