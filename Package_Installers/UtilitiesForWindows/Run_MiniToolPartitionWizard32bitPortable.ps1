# Run_MiniToolPartitionWizard32bitPortable.ps1 - Executa o script de Download e execução de MiniTool Partition Wizard v12 32bit portable.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de baixar e executar o MiniTool Partition Wizard v12 32bit portable no Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-01-20 às 01h10, Marcos Aurélio:
#   - Versão inicial, Download e execução de MiniTool Partition Wizard v12 32bit portable.
# v1.0.1 2024-06-14 às 23h12, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 22h21, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
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

# Se o MiniTool Partition Wizard não estiver instalado, faz o download e instala
$programFiles = "$env:temp"
$directory = "$programFiles\MiniTool-Partition-Wizard-v12-32bit-portable"

if (Test-Path $directory) {
    Write-Host "MiniTool Partition Wizard is installed!"
} else {
    Write-Host "MiniTool Partition Wizard is not installed! Starting installation process."
    Write-Host "File size: 26.7 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/MiniTool-Partition-Wizard-v12-32bit-portable.zip"
    $downloadPath = "$env:temp\MiniTool-Partition-Wizard-v12-32bit-portable.zip"
    
    # Faz o download do MiniTool Partition Wizard
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
    $exePath = Join-Path -Path $extractPath -ChildPath "$extractPath\MiniTool-Partition-Wizard-v12-32bit-portable\partitionwizard.exe"
    # /Extrair o arquivo compactado (.zip)
    
    # Executar o MiniTool Partition Wizard
    Start-Process -FilePath "$extractPath\MiniTool-Partition-Wizard-v12-32bit-portable\partitionwizard.exe" -Wait

    # Apagar o arquivo e o diretório
    Remove-Item -Path $downloadPath -Force
    Remove-Item -Path "$extractPath\MiniTool-Partition-Wizard-v12-32bit-portable" -Recurse -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
