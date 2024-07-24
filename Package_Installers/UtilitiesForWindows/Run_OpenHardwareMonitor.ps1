# Run_OpenHardwareMonitor.ps1 - Executa o script de Download e execução de Open Hardware Monitor.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de baixar e executar o Open Hardware Monitor no Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-07-24 às 00h16, Marcos Aurélio:
#   - Versão inicial, Download e execução de Open Hardware Monitor.
#
# Licença: GPL.

# Configurações
# Tenta encontrar o arquivo config.json na pasta raiz
$configPath = "./config.json"
# Verifica se o arquivo existe no caminho atual
if (-not (Test-Path $configPath)) {
    # Se não existir, tenta o caminho relativo
    $configPath = "../../config.json"
}
# Importa as configurações do arquivo encontrado
$configData = Get-Content -Path $configPath | ConvertFrom-Json

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size($configData.PowerShellTerminalWidth, $configData.PowerShellTerminalHeight)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o Open Hardware Monitor não estiver instalado, faz o download e instala
$programFiles = "$env:temp"
$directory = "$programFiles\OpenHardwareMonitor"

if (Test-Path $directory) {
    Write-Host "Open Hardware Monitor is installed!"
} else {
    Write-Host "Open Hardware Monitor is not installed! Starting installation process."
    Write-Host "File size: 491 KB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/OpenHardwareMonitor.zip"
    $downloadPath = "$env:temp\OpenHardwareMonitor.zip"
    
    # Faz o download do Open Hardware Monitor
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = $configData.beepsOnDownloads
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }

    # Extrair o arquivo compactado (.zip)
    # Definir o caminho do diretório de destino para a extração
    $extractPath = $env:temp

    # Extrair o arquivo zip para o diretório de destino
    Expand-Archive -Path $downloadPath -DestinationPath $extractPath

    # Definir o caminho do arquivo exe dentro do diretório descompactado
    $exePath = Join-Path -Path $extractPath -ChildPath "$extractPath\OpenHardwareMonitor\OpenHardwareMonitor.exe"
    # /Extrair o arquivo compactado (.zip)
    
    # Executar o MiniTool Partition Wizard
    Start-Process -FilePath "$extractPath\OpenHardwareMonitor\OpenHardwareMonitor.exe" -Wait

    # Apagar o arquivo e o diretório
    if (Test-Path "$env:TEMP\$downloadPath") {
        Remove-Item -Path "$env:TEMP\$downloadPath" -Force
    }
    Remove-Item -Path "$extractPath\OpenHardwareMonitor" -Recurse -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
