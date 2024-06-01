Get-NetTCPConnection | ForEach-Object {
    $processId = $_.OwningProcess
    $process = Get-Process -Id $processId -ErrorAction SilentlyContinue
    if ($process) {
        $exeName = $process.ProcessName
    } else {
        $exeName = "Unknown"
    }
    $_ | Select-Object @{Name="ProcessName";Expression={$exeName}}, LocalAddress, LocalPort, RemoteAddress, RemotePort, State
} | Out-File -FilePath ".\NetworkConnections.txt" -Encoding UTF8
