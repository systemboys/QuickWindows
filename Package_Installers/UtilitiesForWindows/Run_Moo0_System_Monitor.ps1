# Run_Moo0_System_Monitor.ps1 - Executa o script de Download e execução de Moo0 System Monitor Portable.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de baixar e executar o Moo0 System Monitor Portable no Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-08-06 às 22h57, Marcos Aurélio:
#   - Versão inicial, Download e execução de Moo0 System Monitor Portable.
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

# Importa o arquivo de URLs
$urlsPath = "./urls.json"
if (-not (Test-Path $urlsPath)) {
    $urlsPath = "../../urls.json"
}
$urlsData = Get-Content -Path $urlsPath | ConvertFrom-Json
$Run_Moo0_System_Monitor = $urlsData.UtilitiesForWindows[28] # Acessa a URL do pacote

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size($configData.PowerShellTerminalWidth, $configData.PowerShellTerminalHeight)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

# ------Importação da função e configuração de endereço e arquivo para Registrar log------
# Tentativa de importar a função a partir de diferentes caminhos
# Primeiro caminho (subindo dois níveis)
$functionPath = "..\..\functions.ps1"

# Verifica se o arquivo existe no primeiro caminho
if (-not (Test-Path $functionPath)) {
    # Se não existir, tenta o caminho alternativo (nível zero)
    $functionPath = ".\functions.ps1"
}

# Importa a função do caminho encontrado
. $functionPath

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O Moo0 System Monitor não está instalado! Iniciando processo de instalação."
Write-Host "Moo0 System Monitor is not installed! Starting installation process."

# Link do download e o diretório Temp
$downloadUrl = $Run_Moo0_System_Monitor
$downloadPath = "$env:temp\Moo0_SystemMonitor_Portable.zip"

# Faz o download do Moo0 System Monitor
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
$exePath = Join-Path -Path $extractPath -ChildPath "$extractPath\Moo0_SystemMonitor_Portable\SystemMonitor64.exe"
# /Extrair o arquivo compactado (.zip)

# Executar o Moo0 System Monitor
Start-Process -FilePath "$extractPath\Moo0_SystemMonitor_Portable\SystemMonitor64.exe" -Wait

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
