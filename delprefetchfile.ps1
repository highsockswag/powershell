# Script to delete contents of the Prefetch folder

# Set the path to the Prefetch folder
$prefetchFolder = "C:\Windows\Prefetch"

# Check if the Prefetch folder exists
if (Test-Path $prefetchFolder) {
    # Remove the contents of the Prefetch folder
    Remove-Item -Path "$prefetchFolder\*" -Force -ErrorAction SilentlyContinue
    Write-Host "Contents of Prefetch folder deleted successfully."
} else {
    Write-Host "Prefetch folder not found."
}
