# Install_RustDesk.ps1 - Executa o script de instalação de RustDesk.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação do
# RustDesk para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-29 às 16h56, Marcos Aurélio:
#   - Versão inicial, Instalação de RustDesk.
#
# Licença: GPL.

# Se o RustDesk não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)"
$directory = "$programFiles\RustDesk"

if (Test-Path $directory) {
    Write-Host "RustDesk is installed!"
} else {
    Write-Host "RustDesk is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Internet/RustDesk_Setup.exe"
    $downloadPath = "$env:temp\RustDesk_Setup.exe"
    
    # Faz o download do RustDesk
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o RustDesk
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

