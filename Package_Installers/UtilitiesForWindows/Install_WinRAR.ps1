# Install_WinRAR.ps1 - Executa o script de instalação de WinRAR.
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
# v0.0.1 2023-11-29 às 13h25, Marcos Aurélio:
#   - Versão inicial, Instalação de WinRAR.
#
# Licença: GPL.

# Se o WinRAR não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\WinRAR"

if (Test-Path $directory) {
    Write-Host "WinRAR is installed!"
} else {
    Write-Host "WinRAR is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/WinRAR.exe"
    $downloadPath = "$env:temp\WinRAR.exe"
    
    # Faz o download do WinRAR
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o WinRAR
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
