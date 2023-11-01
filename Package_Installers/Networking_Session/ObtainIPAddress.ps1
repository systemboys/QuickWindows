$ipAddress = (Test-Connection -ComputerName (hostname) -Count 1).IPV4Address.IPAddressToString
Write-Host "IP Address: $ipAddress"

Start-Sleep -Seconds 10