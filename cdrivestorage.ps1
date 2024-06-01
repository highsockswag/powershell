$folders = Get-ChildItem -Path "C:\" -Directory
foreach ($folder in $folders) {
    $folderName = $folder.FullName
    $size = Get-ChildItem -Path $folderName -Recurse | Measure-Object -Property Length -Sum
    Write-Host "Folder: $($folder.Name), Size: $($size.Sum / 1GB) GB"
}
