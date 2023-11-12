# Install_Microsoft_Edge.ps1 - Executa o script de instalação de Microsoft Edge.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o Microsoft Edge.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-11 às 23h36, Marcos Aurélio:
#   - Versão inicial, opção para instalar o Microsoft Edge.
#
# Licença: GPL.

# Instalar o Microsoft Edge, a página de Download será executada.
# Start-Process "https://www.microsoft.com/pt-br/edge"

# ----------------------------
Write-Host "Microsoft Edge is not installed! Starting installation process."

# Link do download e o diretório Temp
$downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/MicrosoftEdgeSetup.exe"
$downloadPath = "$env:temp\MicrosoftEdgeSetup.exe"

# Faz o download do Microsoft Edge
Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath

# Instala o Microsoft Edge
Start-Process -FilePath "$downloadPath" -Wait

# Apagar o arquivo
Remove-Item -Path $downloadPath -Force
# ----------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

