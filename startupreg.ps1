# Get the path to the registry startup folders
$startupFolders = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run", "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

# Initialize an empty array to store startup items
$startupItems = @()

# Iterate through each startup folder
foreach ($folder in $startupFolders) {
    # Get the list of items in the startup folder
    $items = Get-ItemProperty -Path $folder

    # Add the startup items to the $startupItems array
    foreach ($item in $items) {
        $startupItems += $item
    }
}

# Output the list of startup items
$startupItems
