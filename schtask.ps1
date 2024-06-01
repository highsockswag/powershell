# Run the schtasks command and output the results to a text file
Invoke-Expression "schtasks /query /fo LIST /v" | Out-File -FilePath "ScheduledTasks.txt"
