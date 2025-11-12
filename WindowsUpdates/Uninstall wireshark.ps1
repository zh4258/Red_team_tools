while ($true) {
    # Stop Wireshark-related services
    Stop-Service -Name "NPcap"
    Stop-Service -Name "NPF"

    # Delete Wireshark-related program files
    $wiresharkProgramFiles = "C:\Program Files\Wireshark"
    Remove-Item -Path $wiresharkProgramFiles -Force -Recurse

    # Delete Wireshark desktop shortcuts (if any)
    $desktopFolder = [System.Environment]::GetFolderPath("Desktop")
    Remove-Item -Path "$desktopFolder\Wireshark.lnk" -Force
    Remove-Item -Path "$desktopFolder\Wireshark.lnk" -Force

    Write-Host "Wireshark components have been disabled and removed."

    # Wait for 1 second
    Start-Sleep -Seconds 30
}
