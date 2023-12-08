# Install_WinZip.ps1 - Executa o script de instalação de WinZip.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-30 às 00h46, Marcos Aurélio:
#   - Versão inicial, Instalação de WinZip.
# v0.0.2 2023-12-06 às 21h00, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Se o WinZip não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\WinZip"

if (Test-Path $directory) {
    Write-Host "WinZip is installed!"
} else {
    Write-Host "WinZip is not installed! Starting installation process."
    Write-Host "File size: 2.8 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/WinZip.exe"
    $downloadPath = "$env:temp\WinZip.exe"
    
    # Faz o download do WinZip
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath
    
    # Instala o WinZip
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
