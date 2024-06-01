# Specify the directory to search
$directoryToSearch = "C:\Program Files"

# Specify the output file
$outputFile = "files_with_builtin_users_full_access.txt"

# Open the text file for writing in the current directory
$fileStream = [System.IO.StreamWriter]::new("$PWD\$outputFile")

# Write the header to the text file
$fileStream.WriteLine("File Path, Access Control List")

# Search for files in the directory and check their permissions
Get-ChildItem -Path $directoryToSearch -Recurse -File | ForEach-Object {
    $filePath = $_.FullName
    $acl = Get-Acl -Path $filePath
    $permissions = $acl.Access | Where-Object { $_.IdentityReference -eq "BUILTIN\Users" -and $_.FileSystemRights -eq "FullControl" }

    # If permissions are found, write to the text file
    if ($permissions) {
        $permissionsString = $permissions | ForEach-Object { $_.ToString() }
        $fileStream.WriteLine("$filePath, $permissionsString")
    }
}

# Close the text file
$fileStream.Close()

# Output a message indicating the file has been created
Write-Host "Text file containing files with Full Control access for Builtin\Users has been created: $outputFile"
