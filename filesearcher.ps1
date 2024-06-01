$path = Read-Host "Enter the path"
Get-ChildItem -Path $path -Include *.txt,*.pdf,*.xls,*.xlsx,*.doc,*.docx -File -Recurse -ErrorAction SilentlyContinue