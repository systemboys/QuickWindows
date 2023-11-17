# Install_RealVNCViewer.ps1 - Executa o script de instalação do Real VNC Viewer.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o Real VNC Viewer.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-13 às 23h40, Marcos Aurélio:
#   - Versão inicial, Instalação de Real VNC Viewer.
#
# Licença: GPL.

# Adjusting PowerShell window dimensions
$width = "120"
$height = "30"
$size = New-Object System.Management.Automation.Host.Size($width, $height)
$host.UI.RawUI.WindowSize = $size

# Se o Real VNC Viewer não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\RealVNC\VNC Viewer"

if (Test-Path $directory) {
    Write-Host "Real VNC Viewer is installed!"
} else {
    Write-Host "Real VNC Viewer is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/VNC-Viewer-Windows.exe"
    $downloadPath = "$env:temp\VNC-Viewer-Windows.exe"
    
    # Faz o download do Real VNC Viewer
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Real VNC Viewer
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
