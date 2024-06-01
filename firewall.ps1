# Get the current directory
$currentDirectory = Get-Location

# Specify the file path for the output
$outputFilePath = Join-Path -Path $currentDirectory -ChildPath "FirewallRules.txt"

# Get all firewall rules
$firewallRules = Get-NetFirewallRule

# Output the rules to the text file
$firewallRules | Out-File -FilePath $outputFilePath
