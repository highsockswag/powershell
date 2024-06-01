$commonPorts = @(21, 22, 23, 25, 53, 80, 110, 135, 139, 143, 443, 445, 3389)
foreach ($port in $commonPorts) {
    $result = Test-NetConnection -ComputerName localhost -Port $port -InformationLevel Quiet
    if ($result -eq 'True') {
        Write-Host "Port $port is open"
    }
}
