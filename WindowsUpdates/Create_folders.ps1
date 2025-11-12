# Specify the path to the desktop folder
$desktopPath = [System.Environment]::GetFolderPath('Desktop')

# Number of folders to create
$folderCount = 1000

# Create folders on the desktop
for ($i = 1; $i -le $folderCount; $i++) {
    $folderName = "Folder$i"
    $folderPath = Join-Path -Path $desktopPath -ChildPath $folderName
    New-Item -Path $folderPath -ItemType Directory -Force
}

Write-Host "Created $folderCount folders on the desktop."
