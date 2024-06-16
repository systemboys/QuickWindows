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
# v0.0.2 2024-06-14 às 23h09, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
#
# Licença: GPL.

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size(120, 30)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Configurações
$configData = Get-Content -Path "./config.json" | ConvertFrom-Json

Write-Host "Rufus is not installed! Starting installation process."
Write-Host "File size: 9.9 MB"

# Link do download e o diretório Temp
$downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/rufus_setup.exe"
$downloadPath = "$env:temp\rufus_setup.exe"

# Faz o download do Rufus
Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

# Emitir Sequência de Beeps
$numeroDeBeeps = $configData.beepsOnDownloads
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
