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
#
# Licença: GPL.

# Se o Deep_Freeze não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\Deep Freeze"

Write-Host "Deep Freeze is not installed! Starting installation process."

# Link do download e o diretório Temp
$downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/UtilitiesForWindows/Deep_Freeze.exe"
$downloadPath = "$env:temp\Deep_Freeze.exe"

# Faz o download do Deep_Freeze
Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath

# Instala o Deep_Freeze
Start-Process -FilePath "$downloadPath" -Wait

# Apagar o arquivo
Remove-Item -Path $downloadPath -Force

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
