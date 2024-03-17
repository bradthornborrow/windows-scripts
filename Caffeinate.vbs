Dim objResult

Set objShell = Wscript.CreateObject("Wscript.Shell")

Do While True
  objResult = objShell.sendkeys("+{F15}")
  WScript.Sleep (60000)
Loop