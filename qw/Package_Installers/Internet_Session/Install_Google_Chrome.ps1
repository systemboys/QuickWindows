# Install_Google_Chrome.ps1 - Executa o script de instalação o Google Chrome.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o Google Chrome.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-11 às 23h50, Marcos Aurélio:
#   - Versão inicial, Instalação o Google Chrome.
#
# Licença: GPL.

# Adjusting PowerShell window dimensions
$width = "120"
$height = "30"
$size = New-Object System.Management.Automation.Host.Size($width, $height)
$host.UI.RawUI.WindowSize = $size

# Se o Google Chrome não estiver instalado, faz o download e instala
$programFiles = $env:ProgramFiles
$directory = "$programFiles\Google\Chrome"

if (Test-Path $directory) {
    Write-Host "Google Chrome is installed!"
} else {
    Write-Host "Google Chrome is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/ChromeSetup.exe"
    $downloadPath = "$env:temp\ChromeSetup.exe"
    
    # Faz o download do Google Chrome
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Google Chrome
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
