Dim objResult

Set objShell = Wscript.CreateObject("Wscript.Shell")

Do While True
  objResult = objShell.sendkeys("{NUMLOCK}{NUMLOCK}")
  WScript.Sleep (60000)
Loop