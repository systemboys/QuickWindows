# Install_AnyDesk.ps1 - Executa o script de instalação de AnyDesk.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação do
# AnyDesk para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-10-31 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação de AnyDesk.
# v1.0.1 2023-11-01 às 16h54, Marcos Aurélio:
#   - Correção da verificação da existência do AnyDesk no Windows.
# v1.0.2 2023-11-01 às 22h55, Marcos Aurélio:
#   - Correção na linha de comando que apaga o arquivo de instalação
#     do AnyDesk baixado.
# v1.0.3 2023-12-06 às 20h43, Marcos Aurélio:
#   - Foi informado o tamanho do executável, atualizada a URL e colocada uma condição que executa o AnyDesk caso esteja instalado.
# v1.0.4 2023-12-28 às 17h00, Marcos Aurélio:
#   - Corrigido o caminho do arquivo executável do 'AnyDesk'.
# v1.0.4 2024-06-14 às 22h55, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.4 2024-06-16 às 23h12, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.1.5 2024-07-11 às 00h46, Marcos Aurélio:
#   - Ajuste na remoção do arquivo baixado em Temp, uma condição que verifica a existência do arquivo foi adicionada.
# v1.2.5 2024-07-27 às 23h12, Marcos Aurélio:
#   - Registro de logs.
# v1.3.5 2024-07-31 às 00h18, Marcos Aurélio:
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

# Importa o arquivo de URLs
$urlsPath = "./urls.json"
if (-not (Test-Path $urlsPath)) {
    $urlsPath = "../../urls.json"
}
$urlsData = Get-Content -Path $urlsPath | ConvertFrom-Json
$Install_AnyDesk = $urlsData.Internet[0] # Acessa a URL do pacote

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

# Se o AnyDesk não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)"
$directory = "$programFiles\AnyDesk"

if (Test-Path $directory) {
    # Carrega a biblioteca do .NET Framework para criar a pop-up
    [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null

    # Define a mensagem, o título e os botões da pop-up
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "AnyDesk está instalado, deseja executá-lo?"; Write-Host "Log created in: $logPath"; clear
    $message = "AnyDesk is already installed, do you want to run it?"
    $title = "AnyDesk"
    $buttons = [Microsoft.VisualBasic.MsgBoxStyle]::YesNo

    # Mostra a pop-up ao usuário e guarda a resposta em uma variável
    $response = [Microsoft.VisualBasic.Interaction]::MsgBox($message, $buttons, $title)

    # Verifica se a resposta do usuário foi "Sim"
    if ($response -eq "Yes") {
        # Executa o AnyDesk
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "AnyDesk foi executado."; Write-Host "Log created in: $logPath"; clear
        Start-Process -FilePath "$env:SystemDrive\Program Files (x86)\AnyDesk\AnyDesk.exe"
    } else {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "AnyDesk não foi executado."; Write-Host "Log created in: $logPath"; clear
        exit
    }
} else {
    Write-Host "AnyDesk is not installed! Starting installation process."

    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "AnyDesk não está instalado! Iniciando processo de instalação."; Write-Host "Log created in: $logPath"; clear

    # Link do download e o diretório Temp
    $downloadUrl = $Install_AnyDesk
    $downloadPath = "$env:temp\AnyDesk.exe"
    
    # Faz o download do AnyDesk
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = $configData.beepsOnDownloads
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o AnyDesk
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

    # Apagar o arquivo
    if (Test-Path "$env:TEMP\$downloadPath") {
        Remove-Item -Path "$env:TEMP\$downloadPath" -Force
    }
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "AnyDesk não está instalado, o executável será executado."; Write-Host "Log created in: $logPath"; clear
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

