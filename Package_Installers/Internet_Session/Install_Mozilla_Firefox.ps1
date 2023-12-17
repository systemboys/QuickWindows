# Install_Mozilla_Firefox.ps1 - Executa o script de instalação do Mozilla Firefox.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de o navegador Mozilla Firefox.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-13 às 22h50, Marcos Aurélio:
#   - Versão inicial, Instalação do navetador "Mozilla Firefox".
# v0.0.2 2023-12-06 às 20h48, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Se o Mozilla Firefox não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\Mozilla Firefox"

if (Test-Path $directory) {
    Write-Host "Mozilla Firefox is installed!"
} else {
    Write-Host "Mozilla Firefox is not installed! Starting installation process."
    Write-Host "File size: 389 KB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/Firefox-Installer.exe"
    $downloadPath = "$env:temp\Firefox-Installer.exe"
    
    # Faz o download do Mozilla Firefox
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o Mozilla Firefox
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
