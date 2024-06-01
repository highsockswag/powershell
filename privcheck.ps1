Function Check-EveryonePermission {
    Param (
        [Parameter(Mandatory=$true)]
        [String]$FilePath
    )

    # Get ACL for the file
    $acl = Get-Acl -Path $FilePath

    # Check if "Everyone" has permissions
    foreach ($ace in $acl.Access) {
        if ($ace.IdentityReference -eq 'Everyone') {
            return $true
        }
    }
    return $false
}

Function Find-ExeWithEveryonePermission {
    Param (
        [Parameter(Mandatory=$true)]
        [String]$FolderPath
    )

    # Initialize output array
    $output = @()

    # Recursively search for executables with "Everyone" permission
    Get-ChildItem -Path $FolderPath -Recurse -Filter "*.exe" | ForEach-Object {
        if (Check-EveryonePermission $_.FullName) {
            $output += "Executable file with 'Everyone' permission found: $($_.FullName)"
        }
    }

    # Output to text file
    $output | Out-File -FilePath "priv.txt"
}

# Main script
$FolderPath = Read-Host "Enter the folder path to search for executables"
if (Test-Path $FolderPath -PathType Container) {
    Find-ExeWithEveryonePermission $FolderPath
} else {
    Write-Host "Invalid folder path."
}
