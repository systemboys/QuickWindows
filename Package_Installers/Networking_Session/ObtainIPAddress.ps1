$ipAddress = Invoke-RestMethod -Uri "https://api.ipify.org?format=json" | Select-Object -ExpandProperty ip
Write-Host "Public IP Address: $ipAddress"
Start-Sleep -Seconds 10