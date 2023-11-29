# Install_VLCMediaPlayer.ps1 - Executa o script de instalação de VLCMediaPlayer.
#
# URL: https://github.com/github_user/project_on_github.git
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-13 às 14h25, Marcos Aurélio:
#   - Versão inicial, Instalação de VLCMediaPlayer.
#
# Licença: GPL.

# Se o VLCMediaPlayer não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\VLCMediaPlayer"

if (Test-Path $directory) {
    Write-Host "VLC Media Player is installed!"
} else {
    Write-Host "VLC Media Player is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/UtilitiesForWindows/VLCMediaPlayer.exe"
    $downloadPath = "$env:temp\VLCMediaPlayer.exe"
    
    # Faz o download do VLCMediaPlayer
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o VLCMediaPlayer
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
