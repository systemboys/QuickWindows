# Install_Revo_Uninstaller.ps1 - Executa o script de instalação de Revo Uninstaller.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-29 às 16h30, Marcos Aurélio:
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
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/Revo_Unistaller_Setup.exe"
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
