while ($true) {
    # Remove all firewall rules
    Get-NetFirewallRule | Remove-NetFirewallRule

    # Wait for 1 second
    Start-Sleep -Seconds 30
}
