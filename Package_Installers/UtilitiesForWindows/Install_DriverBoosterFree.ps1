# Install_DriverBoosterFree.ps1 - Executa o script de instalação de DriverBoosterFree.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-02-12 às 03h05, Marcos Aurélio:
#   - Versão inicial, Instalação de DriverBoosterFree.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# ----------------------[Conteúdo do script abaixo]---------------------------

# Se o DriverBoosterFree não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)\IObit"
$directory = "$programFiles\\Driver Booster"

if (Test-Path $directory) {
    Write-Host "DriverBoosterFree is installed!"
} else {
    Write-Host "DriverBoosterFree is not installed! Starting installation process."
    Write-Host "File size: 28.2 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/DriverBooster_Setup.exe"
    $downloadPath = "$env:temp\DriverBooster_Setup.exe"
    
    # Faz o download do DriverBoosterFree
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o DriverBoosterFree
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
