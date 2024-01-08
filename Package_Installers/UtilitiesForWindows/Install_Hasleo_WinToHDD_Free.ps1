# Install_Hasleo_WinToHDD_Free.ps1 - Executa o script de instalação de Hasleo WinToHDD Free.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-29 às 10h50, Marcos Aurélio:
#   - Versão inicial, Instalação de Hasleo WinToHDD Free.
# v0.0.2 2023-12-06 às 21h00, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o Hasleo WinToHDD Free não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files\Hasleo"
$directory = "$programFiles\WinToUSB"

if (Test-Path $directory) {
    Write-Host "Hasleo WinToHDD Free is installed!"
} else {
    Write-Host "Hasleo WinToHDD Free is not installed! Starting installation process."
    Write-Host "File size: 23.6 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/WinToUSB_Free.exe"
    $downloadPath = "$env:temp\WinToHDD.exe"
    
    # Faz o download do WinToHDD
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o WinToHDD
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
