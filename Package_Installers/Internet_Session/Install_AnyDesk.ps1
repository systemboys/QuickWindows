# Verifica se o AnyDesk está instalado
$anydeskInstalled = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "AnyDesk"}

# Se o AnyDesk não estiver instalado, faz o download e instala
if (!$anydeskInstalled) {
    $downloadUrl = "https://download.anydesk.com/AnyDesk.exe"
    $downloadPath = "C:\Temp\AnyDesk.exe"
    
    # Faz o download do AnyDesk
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o AnyDesk
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait
} else {
    Write-Host "AnyDesk já está instalado."
}
