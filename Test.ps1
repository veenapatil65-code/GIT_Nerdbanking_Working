Write-Host "Hello, World!"
Get-Date
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5

Write-Host "Current directory: $(Get-Location)"

# Major breaking change: Replace process listing with service listing (feature)
Write-Host "Listing all Windows services (breaking change: replaces process listing):"
Get-Service | Sort-Object Status | Select-Object -First 5

# New feature: Display disk space information
Write-Host "Disk space information for all drives:"
Get-PSDrive -PSProvider 'FileSystem' | ForEach-Object {
    # Patch fix: Corrected calculation to avoid division by zero
    $usedGB = if ($_.Used -eq $null) { 0 } else { [math]::Round(($_.Used/1GB),2) }
    $freeGB = if ($_.Free -eq $null) { 0 } else { [math]::Round(($_.Free/1GB),2) }
    Write-Host "$($_.Name): Used $usedGB GB, Free $freeGB GB"
}