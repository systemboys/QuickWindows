# Install_AnyDesk.ps1 - Executa o script de instalação de AnyDesk.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação do
# AnyDesk para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-10-31 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação de AnyDesk.
# v0.0.2 2023-11-01 às 16h54, Marcos Aurélio:
#   - Correção da verificação da existência do AnyDesk no Windows.
# v0.0.2 2023-11-01 às 22h55, Marcos Aurélio:
#   - Correção na linha de comando que apaga o arquivo de instalação
#     do AnyDesk baixado.
#
# Licença: GPL.

# Se o AnyDesk não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)"
$directory = "$programFiles\AnyDesk"

if (Test-Path $directory) {
    Write-Host "AnyDesk is installed!"
} else {
    Write-Host "AnyDesk is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://download.anydesk.com/AnyDesk.exe"
    $downloadPath = "$env:temp\AnyDesk.exe"
    
    # Faz o download do AnyDesk
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o AnyDesk
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

