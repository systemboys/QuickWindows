# Install_DriverMax.ps1 - Executa o script de instalação de DriverMax.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-12-29 às 01h41, Marcos Aurélio:
#   - Versão inicial, Instalação de DriverMax.
#
# Licença: GPL.

# # Se o DriverMax não estiver instalado, faz o download e instala
# $programFiles = "$env:SystemDrive\Program Files (x86)\Innovative Solutions"
# $directory = "$programFiles\DriverMax"

# if (Test-Path $directory) {
#     Write-Host "DriverMax is installed!"
# } else {
#     Write-Host "DriverMax is not installed! Starting installation process."
#     Write-Host "File size: 7.01 MB"

#     # Link do download e o diretório Temp
#     $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/DriverMax_setup.exe"
#     $downloadPath = "$env:temp\DriverMax_setup.exe"
    
#     # Faz o download do DriverMax
#     Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

#     # Emitir Sequência de Beeps
#     $numeroDeBeeps = 10
#     for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
#         [Console]::Beep(500, 300)
#         Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
#     }
    
#     # Instala o DriverMax
#     Start-Process -FilePath "$downloadPath" -Wait

#     # Apagar o arquivo
#     Remove-Item -Path $downloadPath -Force
# }

# Write-Host "Press any key to continue..."
# $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# -----------------------------------------

# Se o DriverMax não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)\Innovative Solutions"
$directory = "$programFiles\DriverMax"

if (Test-Path $directory) {
    Write-Host "DriverMax is installed!"
} else {
    Write-Host "DriverMax is not installed! Starting installation process."
    Write-Host "File size: 7.01 MB"

    # Pedir ao usuário para digitar o caminho onde deseja salvar o arquivo
    $saveLocation = Read-Host "Enter the path where you want to save the file (Ex.: C:\Users\UserPC\Downloads)"

    # Verifica se o caminho existe, caso contrário, cria o diretório
    if (-not (Test-Path $saveLocation)) {
        New-Item -ItemType Directory -Path $saveLocation -ErrorAction SilentlyContinue | Out-Null
    }

    # Define o caminho completo para o arquivo de download, incluindo a extensão .exe
    $downloadPath = Join-Path -Path $saveLocation -ChildPath "DriverMax_setup.exe"
    
    # Faz o download do DriverMax
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/DriverMax_setup.exe"
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o DriverMax
    Start-Process -FilePath $downloadPath -Wait
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
