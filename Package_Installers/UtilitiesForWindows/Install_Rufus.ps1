# Install_Rufus.ps1 - Executa o script de instalação de Rufus.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-12-25 às 20h00, Marcos Aurélio:
#   - Versão inicial, Instalação de Rufus.
#
# Licença: GPL.

Write-Host "Rufus is not installed! Starting installation process."
Write-Host "File size: 9.9 MB"

# Link do download e o diretório Temp
$downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/rufus_setup.exe"
$downloadPath = "$env:temp\rufus_setup.exe"

# Faz o download do Rufus
Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

# Emitir Sequência de Beeps
$numeroDeBeeps = 10
for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
    [Console]::Beep(500, 300)
    Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
}

# Instala o Rufus
Start-Process -FilePath "$downloadPath" -Wait

# Apagar o arquivo
Remove-Item -Path $downloadPath -Force

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
