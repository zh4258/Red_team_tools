# Stop Wireshark

By: Thomas McCartney (twm9208)

Usage Instructions:

1. Open up an administrator Powershell prompt
2. Call the script `.\CloseWireshark.ps1`
3. Enjoy as Wireshark closes every second

Alternate Usage:

1. Open up an administrator Powershell prompt
2. Call the script with the parameter `-ProcessName` defined
   1. `.\CloseWireshark.ps1 -ProcessName "Powershell"`
3. Now powershell will be closed every second, or whatever process you enter.
