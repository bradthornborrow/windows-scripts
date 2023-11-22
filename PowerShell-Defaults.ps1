#
# Create PowerShell default profile file if not present
#
New-Item -Path $profile -Type File -Force  -ErrorAction SilentlyContinue | Out-Null
#
# If VS Code installed, open in VS Code, otherwise use notepad
#
if (Get-Command code -errorAction SilentlyContinue)
{
    code $profile
} else {
    notepad $profile
}
