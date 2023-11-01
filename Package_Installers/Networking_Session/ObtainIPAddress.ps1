$ipAddress = Invoke-RestMethod -Uri "https://api.ipify.org?format=json" | Select-Object -ExpandProperty ip
Write-Host "Public IP Address: $ipAddress"
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")