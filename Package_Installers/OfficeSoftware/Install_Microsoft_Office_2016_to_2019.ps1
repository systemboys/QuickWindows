# Install_Microsoft_Office_2016_to_2019.ps1 - Executa o script de instalação de Microsoft Office 2016 a 2019.
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
# v0.0.1 2023-11-29 às 15h53, Marcos Aurélio:
#   - Versão inicial, Instalação de Microsoft Office 2016 a 2019.
#
# Licença: GPL.

# Se o Microsoft Office não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\Microsoft Office"

if (Test-Path $directory) {
    Write-Host "Microsoft Office is installed!"
} else {
    Write-Host "Microsoft Office is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/Microsoft_Office_2016-2019.exe"
    $downloadPath = "$env:temp\Microsoft_Office_2016-2019.exe"
    
    # Faz o download do Microsoft Office
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Microsoft Office
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
