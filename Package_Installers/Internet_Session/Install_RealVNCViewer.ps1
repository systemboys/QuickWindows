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
# v0.0.2 2023-12-06 às 20h51, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Se o Real VNC Viewer não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\RealVNC\VNC Viewer"

if (Test-Path $directory) {
    Write-Host "Real VNC Viewer is installed!"
} else {
    Write-Host "Real VNC Viewer is not installed! Starting installation process."
    Write-Host "File size: 11 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/VNC-Viewer-Windows.exe"
    $downloadPath = "$env:temp\VNC-Viewer-Windows.exe"
    
    # Faz o download do Real VNC Viewer
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o Real VNC Viewer
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
