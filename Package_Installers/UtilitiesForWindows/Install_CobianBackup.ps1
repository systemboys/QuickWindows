# Install_CobianBackup.ps1 - Executa o script de instalação de Cobian Backup.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-02-21 às 22h46, Marcos Aurélio:
#   - Versão inicial, Instalação de Cobian Backup.
# v1.0.1 2024-06-14 às 23h06, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 21h53, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.1.2 2024-07-11 às 00h46, Marcos Aurélio:
#   - Ajuste na remoção do arquivo baixado em Temp, uma condição que verifica a existência do arquivo foi adicionada.
# v1.2.2 2024-07-29 às 01h25, Marcos Aurélio:
#   - Registro de logs.
# v1.3.2 2024-07-31 às 23h41, Marcos Aurélio:
#   - Incrementação de arquivo JSON para URLs, chamada URLs na lista do arquivo JSON.
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

# Importa o arquivo de URLs
$urlsPath = "./urls.json"
if (-not (Test-Path $urlsPath)) {
    $urlsPath = "../../urls.json"
}
$urlsData = Get-Content -Path $urlsPath | ConvertFrom-Json
$Install_CobianBackup = $urlsData.UtilitiesForWindows[3] # Acessa a URL do pacote

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

# ----------------------[Conteúdo do script abaixo]---------------------------

# Se o Cobian Backup não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)"
$directory = "$programFiles\Cobian Backup 11"

if (Test-Path $directory) {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O Cobian Backup está instalado!"
    Write-Host "Cobian Backup is installed!"
} else {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Cobian Backup não está instalado! Iniciando processo de instalação."
    Write-Host "Cobian Backup is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = $Install_CobianBackup
    $downloadPath = "$env:temp\Cobian_Backup_Setup.exe"
    
    # Faz o download do Cobian Backup
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = $configData.beepsOnDownloads
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o Cobian Backup
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    if (Test-Path "$env:TEMP\$downloadPath") {
        Remove-Item -Path "$env:TEMP\$downloadPath" -Force
    }
}

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
