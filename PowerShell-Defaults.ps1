#
# Create PowerShell default profile if it doesn't exist
#
New-Item -Path $profile -Type File -Force -ErrorAction SilentlyContinue | Out-Null
#
Copy-Item  .\Microsoft.PowerShell_profile.ps1 -Destination $profile -Force -ErrorAction SilentlyContinue | Out-Null