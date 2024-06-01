Get-WmiObject -Class Win32_QuickFixEngineering | Select-Object -Property Caption, Description, HotFixID, InstalledOn | Out-File -FilePath ".\updates.txt"
