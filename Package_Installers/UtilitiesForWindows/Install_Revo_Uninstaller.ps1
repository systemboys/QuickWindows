# Install_Revo_Uninstaller.ps1 - Executa o script de instalação de Revo Uninstaller.
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
# v0.0.1 2023-10-31 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação de Revo Uninstaller.
#
# Licença: GPL.

# Se o Revo Uninstaller não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files\VS Revo Group"
$directory = "$programFiles\Revo Uninstaller"

if (Test-Path $directory) {
    Write-Host "Revo Uninstaller is installed!"
} else {
    Write-Host "Revo Uninstaller is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/UtilitiesForWindows/Revo_Uninstaller_Setup.exe"
    $downloadPath = "$env:temp\Revo_Uninstaller_Setup.exe"
    
    # Faz o download do Revo Uninstaller
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Revo Uninstaller
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
