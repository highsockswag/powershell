# Get all running services
$services = Get-Service | Where-Object {$_.Status -eq "Running"}

# Specify the filename for the text file
$outputFile = "services.txt"

# Open the text file for writing in the current directory
$fileStream = [System.IO.StreamWriter]::new("$PWD\$outputFile")

# Write the header to the text file
$fileStream.WriteLine("DisplayName, Status, ServiceName, StartType, StartName, ServiceAccount, PathName")

# Retrieve additional information about the service accounts and write to the text file
foreach ($service in $services) {
    $serviceInfo = $service | Select-Object DisplayName, Status, ServiceName, StartType, StartName, @{Name="ServiceAccount"; Expression={(Get-WmiObject -Class Win32_Service -Filter "Name='$($_.ServiceName)'").StartName}}, @{Name="PathName"; Expression={(Get-WmiObject -Class Win32_Service -Filter "Name='$($_.ServiceName)'").PathName}}
    $fileStream.WriteLine("$($serviceInfo.DisplayName), $($serviceInfo.Status), $($serviceInfo.ServiceName), $($serviceInfo.StartType), $($serviceInfo.StartName), $($serviceInfo.ServiceAccount), $($serviceInfo.PathName)")
}

# Close the text file
$fileStream.Close()

# Output a message indicating the file has been created
Write-Host "Text file containing running services with service account information has been created: $outputFile"
