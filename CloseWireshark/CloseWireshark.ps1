#twm9208@rit.edu
[CmdletBinding()]
param(
    [System.String]$ProcessName
)

if ($ProcessName -eq ""){
    $ProcessName = "Wireshark" #set the default to Wireshark
}

while ($true) { 
    $process = Get-Process |Where-Object {$_.Name -eq $ProcessName} #Find a process with the matching name
    if ($process) { #If it exists
        Stop-Process -Id $process.Id #kill it
    }
    Start-Sleep -Seconds 1
}
