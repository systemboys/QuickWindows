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
$Download_Package_1 = $urlsData.MicrosoftOperatingSystems[0] # Acessa a URL do pacote de instalação do Windows 7, todas as versões
$Download_Package_2 = $urlsData.MicrosoftOperatingSystems[1] # Acessa a URL do pacote de instalação do Windows 7 Lite
$Download_Package_3 = $urlsData.MicrosoftOperatingSystems[2] # Acessa a URL do pacote de instalação do Windows 10 Pro 32bits
$Download_Package_4 = $urlsData.MicrosoftOperatingSystems[3] # Acessa a URL do pacote de instalação do Windows 10 Pro 64bits
$Download_Package_5 = $urlsData.MicrosoftOperatingSystems[4] # Acessa a URL do pacote de instalação do Windows 10 1909 PRO MSDN LITE Build
$Download_Package_6 = $urlsData.MicrosoftOperatingSystems[5] # Acessa a URL do pacote de instalação do Windows 11 Pro
$Download_Package_7 = $urlsData.MicrosoftOperatingSystems[6] # Acessa a URL do pacote de instalação do Windows Server 2022

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

# [1]=Windows 7, todas as versões
# [2]=Windows 7 Lite
# [3]=Windows 10 Pro 32bits
# [4]=Windows 10 Pro 64bits
# [5]=Windows 10 1909 PRO MSDN LITE Build
# [6]=Windows 11 Pro
# [7]=Windows Server 2022

# Windows 7, todas as versões
$url1 = $Download_Package_1

# Windows 7 Lite
$url2 = $Download_Package_2

# Windows 10 Pro 32bits
$url3 = $Download_Package_3

# Windows 10 Pro 64bits
$url4 = $Download_Package_4

# Windows 10 1909 PRO MSDN LITE Build
$url5 = $Download_Package_5

# Windows 11 Pro
$url6 = $Download_Package_6

# Windows Server 2022
$url7 = $Download_Package_7

# Verificação e download do arquivo com base na escolha
switch ($numero) {
    1 { $url = $url1 } # Windows 7, todas as versões
    2 { $url = $url2 } # Windows 7 Lite
    3 { $url = $url3 } # Windows 10 Pro 32bits
    4 { $url = $url4 } # Windows 10 Pro 64bits
    5 { $url = $url5 } # Windows 10 1909 PRO MSDN LITE Build
    6 { $url = $url6 } # Windows 11 Pro
    7 { $url = $url7 } # Windows Server 2022
    default {
        Write-Host "Invalid option. Please choose a valid option."
        exit
    }
}

# Solicitação do local de destino
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Insira o caminho de destino completo para salvar o arquivo."
$destination = Read-Host "Enter the full destination path to save the file"

# Verificação se o destino foi fornecido
if (-not $destination) {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O destino é obrigatório. Por favor, forneça o caminho de destino."
    Write-Host "Destination is mandatory. Please provide the destination path."
    exit
}

# Executar o gerenciador de tarefas do Windows para monitorar o desempenho do download
start taskmgr

# Iniciando o download em uma nova janela do PowerShell
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Iniciando o download em uma nova janela..."
Write-Host "Starting the download in a new window..."
Start-BitsTransfer -Source $url -Destination $destination

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
