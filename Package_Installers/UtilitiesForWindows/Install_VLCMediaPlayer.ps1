# Install_VLCMediaPlayer.ps1 - Executa o script de instalação de VLCMediaPlayer.
#
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
# v0.0.2 2023-12-06 às 20h59, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Se o VLCMediaPlayer não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)\VideoLAN"
$directory = "$programFiles\VLC"

if (Test-Path $directory) {
    Write-Host "VLC Media Player is installed!"
} else {
    Write-Host "VLC Media Player is not installed! Starting installation process."
    Write-Host "File size: 40.9 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/VLCMediaPlayer.exe"
    $downloadPath = "$env:temp\VLCMediaPlayer.exe"
    
    # Faz o download do VLCMediaPlayer
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o VLCMediaPlayer
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
