 # Get installed software names
$installedSoftware = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object DisplayName

# Get process names from registry startup folders
$startupFolders = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run", "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$startupProcesses = foreach ($folder in $startupFolders) {
    Get-ItemProperty -Path $folder | Select-Object -ExpandProperty '(Default)'
}

# Output the results
Write-Host "Installed Software:"
$installedSoftware

Write-Host "`nProcesses from Startup Folders:"
$startupProcesses
