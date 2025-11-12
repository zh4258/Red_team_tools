# Check if the Telnet Client feature is already installed
if (-not (Get-WindowsFeature Telnet-Client)) {
    # Install the Telnet Client feature
    Install-WindowsFeature Telnet-Client
    Write-Host "Telnet Client feature installed."
} else {
    Write-Host "Telnet Client feature is already installed."
}

# Ensure the Telnet Client service is running
$telnetService = Get-Service -Name TlntSvr
if ($telnetService.Status -ne 'Running') {
    Start-Service -Name TlntSvr
    Write-Host "Telnet service started."
} else {
    Write-Host "Telnet service is already running."
}
