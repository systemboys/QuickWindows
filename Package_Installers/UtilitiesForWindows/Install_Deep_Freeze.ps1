# Install_Deep_Freeze.ps1 - Executa o script de instalação de Deep Freeze.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-30 às 01h02, Marcos Aurélio:
#   - Versão inicial, Instalação de Deep Freeze.
# v0.0.2 2023-12-06 às 20h56, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o Deep_Freeze não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\Deep Freeze"

Write-Host "Deep Freeze is not installed! Starting installation process."
Write-Host "File size: 20.5 MB"

# Link do download e o diretório Temp
$downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/Deep_Freeze.exe"
$downloadPath = "$env:temp\Deep_Freeze.exe"

# Faz o download do Deep_Freeze
Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

# Emitir Sequência de Beeps
$numeroDeBeeps = 10
for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
    [Console]::Beep(500, 300)
    Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
}

# Instala o Deep_Freeze
Start-Process -FilePath "$downloadPath" -Wait

# Apagar o arquivo
Remove-Item -Path $downloadPath -Force

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
