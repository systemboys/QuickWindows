# Install_Google_Chrome.ps1 - Executa o script de instalação o Google Chrome.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o Google Chrome.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-11 às 23h50, Marcos Aurélio:
#   - Versão inicial, Instalação o Google Chrome.
# v0.0.2 2023-12-06 às 20h40, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o Google Chrome não estiver instalado, faz o download e instala
$programFiles = $env:ProgramFiles
$directory = "$programFiles\Google\Chrome"

if (Test-Path $directory) {
    Write-Host "Google Chrome is installed!"
} else {
    Write-Host "Google Chrome is not installed! Starting installation process."
    Write-Host "File size: 1.31 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/ChromeSetup.exe"
    $downloadPath = "$env:temp\ChromeSetup.exe"
    
    # Faz o download do Google Chrome
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o Google Chrome
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
