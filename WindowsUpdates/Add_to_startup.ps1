# Define the path to your .bat script
$ScriptPath = "C:Windows\WindowsUpdates\Gray - Do not touch.bat"

# Get the "All Users" startup folder path
$AllUsersStartupFolder = [System.Environment]::GetFolderPath("CommonStartup")

# Define the name for the shortcut (without the .lnk extension)
$ShortcutName = "MyScript"

# Create a Shell.Application COM object
$Shell = New-Object -ComObject WScript.Shell

# Create a shortcut to the .bat script in the "All Users" startup folder
$Shortcut = $Shell.CreateShortcut([System.IO.Path]::Combine($AllUsersStartupFolder, "$ShortcutName.lnk"))
$Shortcut.TargetPath = $ScriptPath
$Shortcut.Save()

Write-Host "Added $ScriptPath to the 'All Users' startup folder."
