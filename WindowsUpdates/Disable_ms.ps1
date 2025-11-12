# Disable the mouse input
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "HID-compliant mouse").InstanceId

# To re-enable the mouse input, use the following command
# Enbale InstanceId (Get-PnpDevice -FriendlyName "HID-compliant mouse").InstanceId
