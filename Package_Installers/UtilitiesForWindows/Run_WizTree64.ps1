# Run_WizTree64.ps1 - Executa o script de download e execução do WizTree64.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2025-09-09 às 15h37, Marcos Aurélio:
#   - Versão inicial, Download e execução do WizTree64.
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
$WizTree64Url = $urlsData.UtilitiesForWindows[30] # Acessa a URL do WizTree64 (ajuste o índice conforme necessário)

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

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "WizTree64 não está instalado! Iniciando processo de download e execução."
Write-Host "WizTree64 is not installed! Starting download and execution process."

# Link do download e o diretório Temp
$downloadUrl = $WizTree64Url
$downloadPath = "$env:temp\wiztree64_setup.exe"

# Faz o download do WizTree64
Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

# Emitir Sequência de Beeps
$numeroDeBeeps = $configData.beepsOnDownloads
for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
    [Console]::Beep(500, 300)
    Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
}

# Executa o WizTree64
Start-Process -FilePath "$downloadPath" -Wait

# Apagar o arquivo
if (Test-Path "$env:TEMP\wiztree64_setup.exe") {
    Remove-Item -Path "$env:TEMP\wiztree64_setup.exe" -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
