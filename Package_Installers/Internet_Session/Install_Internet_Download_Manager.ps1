# Install_Internet_Download_Manager.ps1 - Executa o script de instalação de Internet_Download_Manager.
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
# v0.0.1 2023-12-01 às 22h28, Marcos Aurélio:
#   - Versão inicial, Instalação de Internet Download Manager.
#
# Licença: GPL.

# Se o Internet Download Manager não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)"
$directory = "$programFiles\Internet Download Manager"

if (Test-Path $directory) {
    Write-Host "Internet Download Manager is installed!"
} else {
    Write-Host "Internet Download Manager is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/Internet_Download_Manager.exe"
    $downloadPath = "$env:temp\Internet_Download_Manager.exe"
    
    # Faz o download do Internet Download Manager
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Internet Download Manager
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
