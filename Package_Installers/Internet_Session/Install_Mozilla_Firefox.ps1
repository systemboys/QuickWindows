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
# v0.0.3 2024-06-14 às 22h56, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v0.0.4 2024-06-16 às 23h17, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
#
# Licença: GPL.

# Configurações
$configData = Get-Content -Path "./config.json" | ConvertFrom-Json

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size($configData.PowerShellTerminalWidth, $configData.PowerShellTerminalHeight)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

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
    $numeroDeBeeps = $configData.beepsOnDownloads
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
