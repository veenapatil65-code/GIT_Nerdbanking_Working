Write-Host "Hello, World!"
Get-Date

# Major breaking change: Replace network adapter summary with IP configuration details
Write-Host "Listing IP configuration details for all network adapters (breaking change):"
Get-NetIPConfiguration | Select-Object InterfaceAlias, IPv4Address, IPv6Address, DNSServer | Format-Table -AutoSize

Write-Host "Current directory: $(Get-Location)"

# New feature: Display disk space information
Write-Host "Disk space information for all drives:"
Get-PSDrive -PSProvider 'FileSystem' | ForEach-Object {
    # Patch fix: Corrected calculation to avoid division by zero
    $usedGB = if ($_.Used -eq $null) { 0 } else { [math]::Round(($_.Used/1GB),2) }
    $freeGB = if ($_.Free -eq $null) { 0 } else { [math]::Round(($_.Free/1GB),2) }
    Write-Host "$($_.Name): Used $usedGB GB, Free $freeGB GB"
}