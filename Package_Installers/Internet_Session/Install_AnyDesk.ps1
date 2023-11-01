# Install_AnyDesk.ps1 - Executa o script de instalação de AnyDesk.
#
# URL: https://github.com/github_user/project_on_github.git
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finadade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-10-31 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação de AnyDesk.
#
# Licença: GPL.

# Verifica se o AnyDesk está instalado
$anydeskInstalled = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "AnyDesk"}

# Se o AnyDesk não estiver instalado, faz o download e instala
if (!$anydeskInstalled) {
    Write-Host "AnyDesk is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://download.anydesk.com/AnyDesk.exe"
    $downloadPath = "$env:temp\AnyDesk.exe"
    
    # Faz o download do AnyDesk
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o AnyDesk
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

    # Apagar o arquivo
    $filePath = "C:\Path\to\AnyDesk.exe"
    Remove-Item -Path $filePath -Force
} else {
    Write-Host "AnyDesk is now installed!"
}
