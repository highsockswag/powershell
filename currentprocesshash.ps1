# Get the current running processes
$processes = Get-Process

# Initialize an empty array to store process names and hashes
$processHashes = @()

# Loop through each process
foreach ($process in $processes) {
    # Calculate the hash of the process name
    $processNameBytes = [System.Text.Encoding]::UTF8.GetBytes($process.Name)
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $hashBytes = $sha256.ComputeHash($processNameBytes)
    $hashString = [System.BitConverter]::ToString($hashBytes) -replace '-', ''
    $hashString = $hashString.ToLower()
    
    # Create a custom object to store process information and hash
    $processInfo = [PSCustomObject]@{
        ProcessName = $process.Name
        Hash = $hashString
    }

    # Add the process info to the array
    $processHashes += $processInfo
}

# Export the process hashes to a text file
$processHashes | Export-Csv -Path "process_hashes.csv" -NoTypeInformation
