# Install_AdobeReaderPDF.ps1 - Executa o script de instalação de Adobe Reader.
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
# v0.0.1 2023-11-29 às 13h51, Marcos Aurélio:
#   - Versão inicial, Instalação de AdobeReaderPDF.
#
# Licença: GPL.

# Se o Adobe Reader não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\Adobe Reader"

if (Test-Path $directory) {
    Write-Host "Adobe Reader is installed!"
} else {
    Write-Host "Adobe Reader is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/UtilitiesForWindows/readerdc64_br_xa_mdr_install_win10_64bits.exe"
    $downloadPath = "$env:temp\readerdc64_br_xa_mdr_install_win10_64bits.exe"
    
    # Faz o download do Adobe Reader
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Adobe Reader
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
