Write-Host "Hello, World!"
Get-Date
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5

Write-Host "Current directory: $(Get-Location)"