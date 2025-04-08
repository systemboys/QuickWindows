# Download.ps1 - Executa o script de Download de Softwares.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar o Download de Softwares de instalação do Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-12-11 às 20h51, Marcos Aurélio:
#   - Versão inicial, Download de Softwares.
# v1.1.0 2023-12-13 às 20h51, Marcos Aurélio:
#   - Emitir Sequência de Beeps após Downloads.
# v1.1.1 2024-04-22 às 17h14, Marcos Aurélio:
#   - Correção dos links na sessão.
# v1.1.2 2024-06-14 às 23h00, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.2.1 2024-06-16 às 23h10, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.2 2024-07-06 às 12h50, Marcos Aurélio:
#   - Linha de comando para executar o gerenciador de tarefas do Windows para monitorar
#     o desempenho do download.
# v1.3.2 2024-07-28 às 00h29, Marcos Aurélio:
#   - Registro de logs.
# v1.4.2 2024-07-31 às 01h47, Marcos Aurélio:
#   - Incrementação de arquivo JSON para URLs, chamada URLs na lista do arquivo JSON.
# v1.4.3 2025-04-04 às 11h32, Marcos Aurélio:
#   - Atualização dos links das ISOs de 'Win10 22H2 x32v1', 'Win10 22H2 x64v1' e 'Win11 24H2 x64'. 
#
# Licença: GPL.

# Recebe um argumento que pode ser um número
param (
    [Parameter(Mandatory=$true)]
    [int]$numero
)

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
$Download_Package_1 = $urlsData.MicrosoftOperatingSystems[0] # Acessa a URL do pacote de instalação do Win10_22H2_BrazilianPortuguese_x32v1
$Download_Package_2 = $urlsData.MicrosoftOperatingSystems[1] # Acessa a URL do pacote de instalação do Win10_22H2_BrazilianPortuguese_x64v1
$Download_Package_3 = $urlsData.MicrosoftOperatingSystems[2] # Acessa a URL do pacote de instalação do Win11_24H2_BrazilianPortuguese_x64
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

# [1]=Win10_22H2_BrazilianPortuguese_x32v1
# [2]=Win10_22H2_BrazilianPortuguese_x64v1
# [3]=Win11_24H2_BrazilianPortuguese_x64

# Win10_22H2_BrazilianPortuguese_x32v1
$url1 = $Download_Package_1

# Win10_22H2_BrazilianPortuguese_x64v1
$url2 = $Download_Package_2

# Win11_24H2_BrazilianPortuguese_x64
$url3 = $Download_Package_3

# Verificação e download do arquivo com base na escolha
switch ($numero) {
    1 { $url = $url1 } # Win10_22H2_BrazilianPortuguese_x32v1
    2 { $url = $url2 } # Win10_22H2_BrazilianPortuguese_x64v1
    3 { $url = $url3 } # Win11_24H2_BrazilianPortuguese_x64
    default {
        Write-Host "Invalid option. Please choose a valid option."
        exit
    }
}

# Solicitação do local de destino
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Insira o caminho de destino completo para salvar o arquivo."

# Solicita ao usuário somente o diretório de destino
$destinationDirectory = Read-Host "Enter the destination folder path to save the file"

# Verificação se o destino foi fornecido
if (-not $destinationDirectory) {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O destino é obrigatório. Por favor, forneça o caminho de destino."
    Write-Host "Destination is mandatory. Please provide the destination path."
    exit
}

# Extrai o nome do arquivo diretamente da URL
$fileName = Split-Path -Path $url -Leaf
$destination = Join-Path -Path $destinationDirectory -ChildPath $fileName

# Certifique-se de criar o diretório, se não existir:
if (!(Test-Path $destinationDirectory)) {
    New-Item -Path $destinationDirectory -ItemType Directory -Force
}

# Executar o gerenciador de tarefas do Windows para monitorar o desempenho do download
start taskmgr

# Iniciando o download em uma nova janela do PowerShell
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Iniciando o download em uma nova janela..."
Write-Host "Starting the download in a new window..."
Write-Host "URL: $url"
Write-Host "Destino corrigido: $destination"

Start-BitsTransfer -Source "$url" -Destination "$destination"

# Certifique-se de criar o diretório, se não existir:
$directory = Split-Path -Parent $destination
if (!(Test-Path $directory)) {
    New-Item -Path $directory -ItemType Directory -Force
}

Start-BitsTransfer -Source "$url" -Destination "$destination"

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Transferência concluída!"
Write-Host "Download completed!"

# Emitir Sequência de Beeps
$numeroDeBeeps = $configData.beepsOnDownloads
for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
    [Console]::Beep(500, 300)
    Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
