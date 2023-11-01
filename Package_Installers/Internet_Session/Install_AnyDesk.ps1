# Verifica se o AnyDesk está instalado
$anydeskInstalled = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "AnyDesk"}

# Se o AnyDesk não estiver instalado, faz o download e instala
if (!$anydeskInstalled) {
    Write-Host "AnyDesk is not installed! Starting installation process."

    $downloadUrl = "https://download.anydesk.com/AnyDesk.exe"
    $downloadPath = "$env:temp\AnyDesk.exe"
    
    # Faz o download do AnyDesk
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o AnyDesk
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

    # Pagar o arquivo
    $filePath = "C:\Path\to\AnyDesk.exe"
    Remove-Item -Path $filePath -Force
} else {
    Write-Host "AnyDesk is now installed!"
}
