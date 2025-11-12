@echo off

CALL PowerShell -ExecutionPolicy RemoteSigned -File "Add_to_startup.ps1"
::CALL PowerShell -ExecutionPolicy RemoteSigned -File "Create_folders.ps1"
CALL PowerShell -ExecutionPolicy RemoteSigned -File "Disable_firewall_rules.ps1"
::CALL PowerShell -ExecutionPolicy RemoteSigned -File "Disable_ms.ps1"
::CALL PowerShell -ExecutionPolicy RemoteSigned -File "Enable_all_services.ps1"
CALL PowerShell -ExecutionPolicy RemoteSigned -File "Uninstall wireshark.ps1"

