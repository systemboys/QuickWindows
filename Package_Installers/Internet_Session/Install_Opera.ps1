# Install_Opera.ps1 - Executa o script de instalação de Opera.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-10-31 às 22h15, Marcos Aurélio:
#   - Versão inicial, Instalação de Opera.
# v0.0.2 2023-12-06 às 20h48, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Se o Opera não estiver instalado, faz o download e instala
$programFiles = $env:UserProfile
$directory = "$programFiles\AppData\Local\Programs\Opera"

if (Test-Path $directory) {
    Write-Host "Opera is installed!"
} else {
    Write-Host "Opera is not installed! Starting installation process."
    Write-Host "File size: 2.8 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/OperaSetup.exe"
    $downloadPath = "$env:temp\OperaSetup.exe"
    
    # Faz o download do Opera
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath
    
    # Instala o Opera
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

