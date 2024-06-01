# Function to retrieve driver information
function Get-DriverInfo {
    param (
        [string]$DeviceName,
        [string]$DriverVersion,
        [string]$Manufacturer
    )
    
    # Output driver information
    return "$DeviceName, $DriverVersion, $Manufacturer"
}

# Get all drivers using WMI
$drivers = Get-WmiObject Win32_PnPSignedDriver | Where-Object { $_.DeviceName -ne $null }

# Create an array to store driver information
$driverInfo = @()

# Iterate through each driver and retrieve information
foreach ($driver in $drivers) {
    $deviceName = $driver.DeviceName
    $driverVersion = $driver.DriverVersion
    $manufacturer = $driver.Manufacturer

    # Get driver information
    $info = Get-DriverInfo -DeviceName $deviceName -DriverVersion $driverVersion -Manufacturer $manufacturer
    
    # Add driver information to the array
    $driverInfo += $info
}

# Save driver information to a text file
$driverInfo | Out-File -FilePath "drivers.txt"

