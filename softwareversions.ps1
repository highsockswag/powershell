# Run the wmic command and output the results to a text file
Start-Process -FilePath "wmic" -ArgumentList "product get name,version,vendor" -RedirectStandardOutput "vers.txt" -NoNewWindow -Wait
