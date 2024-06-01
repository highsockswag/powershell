# Read the content of the file into an array of strings
$content = Get-Content test.txt

# Loop through each line and execute it
foreach ($line in $content) {
    # Skip empty lines and lines that start with '#'
    if (-not [string]::IsNullOrWhiteSpace($line) -and -not $line.StartsWith("#")) {
        Invoke-Expression $line
    }
}
