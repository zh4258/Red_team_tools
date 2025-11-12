# Get a list of all services and set their startup type to "Automatic"
Get-Service | ForEach-Object {
    if ($_.Status -eq 'Stopped') {
        Set-Service -Name $_.Name -StartupType Automatic
        Start-Service -Name $_.Name
        Write-Host "Enabled and started service: $($_.Name)"
    } else {
        Set-Service -Name $_.Name -StartupType Automatic
        Write-Host "Enabled service: $($_.Name)"
    }
}
