#
# Create PowerShell default profile file if not present
#
$ps_profile_path = "$env:USERPROFILE\Documents\WindowsPowerShell"
md $ps_profile_path -ErrorAction SilentlyContinue
New-Item $ps_profile_path\Microsoft.PowerShell_profile.ps1 -ItemType "file" -ErrorAction SilentlyContinue
#
# If VS Code installed, open in VS Code, otherwise use notepad
#
if (Get-Command code -errorAction SilentlyContinue)
{
    code $ps_profile_path\Microsoft.PowerShell_profile.ps1
} else {
    notepad $ps_profile_path\Microsoft.PowerShell_profile.ps1
}

