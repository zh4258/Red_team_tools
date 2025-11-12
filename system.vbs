Set WshShell = WScript.CreateObject("WScript.Shell")

WshShell.Run "explorer.exe"

WScript.Sleep 900000

Do
    WshShell.Run "notepad.exe"
    WScript.Sleep 7000
    WshShell.Run "calc.exe"
    WScript.Sleep 7000
    WshShell.Run "mspaint.exe"
    WScript.Sleep 7000
Loop

