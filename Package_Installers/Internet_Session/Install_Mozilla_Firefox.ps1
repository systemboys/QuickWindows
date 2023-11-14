# Install_Mozilla_Firefox.ps1 - Executa o script de instalação do Mozilla Firefox.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de o navegador Mozilla Firefox.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-13 às 22h50, Marcos Aurélio:
#   - Versão inicial, Instalação do navetador "Mozilla Firefox".
#
# Licença: GPL.

# Se o Mozilla Firefox não estiver instalado, faz o download e instala
$programFiles = [Environment]::GetEnvironmentVariable("ProgramFiles(x86)")
$directory = "$programFiles\Mozilla Firefox"

if (Test-Path $directory) {
    Write-Host "Mozilla Firefox is installed!"
} else {
    Write-Host "Mozilla Firefox is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/Firefox-Installer.exe"
    $downloadPath = "$env:temp\Firefox-Installer.exe"
    
    # Faz o download do Mozilla Firefox
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Mozilla Firefox
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
