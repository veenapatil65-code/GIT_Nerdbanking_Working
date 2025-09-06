Write-Host "Hello, World!"
Get-Date
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5

Write-Host "Current directory: $(Get-Location)"

# Major breaking change: Replace process listing with service listing (feature)
Write-Host "Listing all Windows services (breaking change: replaces process listing):"
Get-Service | Sort-Object Status | Select-Object -First 5