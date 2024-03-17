# Useful references:
#
# https://superuser.com/questions/992511/emulate-a-keyboard-button-via-the-command-line
# https://ss64.com/vb/sendkeys.html
#
$wsh = New-Object -ComObject WScript.Shell
while (1) {
  # Send Shift+F15 - this is the least intrusive key combination I can think of and is also used as default by:
  # http://www.zhornsoftware.co.uk/caffeine/
  $wsh.SendKeys('+{F15}')
  Start-Sleep -seconds 59
}