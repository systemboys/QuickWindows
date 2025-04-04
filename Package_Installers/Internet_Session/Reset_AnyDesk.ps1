# Reset_AnyDesk.ps1 - Executa o script de redefinição do AnyDesk.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de redefinir o AnyDesk.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-10-31 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação de Reset AnyDesk.
# v1.0.1 2024-06-14 às 22h59, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 23h22, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.1 2024-07-28 às 00h18, Marcos Aurélio:
#   - Registro de logs.
# v1.2.2 2024-10-30 às 12h04, Marcos Aurélio:
#   - Ajuste no script que reseta o AnyDesk, agora o script preserva as sessções recentes assim como as miniaturas dos PCs remotos.
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

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

# ----------------------[Conteúdo do script abaixo]---------------------------

# Se o AnyDesk não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)"
$directory = "$programFiles\AnyDesk"

if (Test-Path $directory) {
    # Define a mensagem, o título e os botões da pop-up
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Mensagem aqui..."
    Write-Host "AnyDesk is already installed, resetting the settings!"

    # Define a função para parar o serviço AnyDesk
    function Stop-AnyDesk {
        Stop-Service -Name AnyDesk -ErrorAction SilentlyContinue
        Get-Process -Name "AnyDesk" | Stop-Process -Force
    }

    # Define a função para iniciar o serviço AnyDesk
    function Start-AnyDesk {
        Start-Service -Name AnyDesk
        $AnyDesk1 = Join-Path -Path $env:SystemDrive -ChildPath "Program Files (x86)\AnyDesk\AnyDesk.exe"
        $AnyDesk2 = Join-Path -Path $env:SystemDrive -ChildPath "Program Files\AnyDesk\AnyDesk.exe"
        if (Test-Path -Path $AnyDesk1) { Start-Process -FilePath $AnyDesk1 }
        if (Test-Path -Path $AnyDesk2) { Start-Process -FilePath $AnyDesk2 }
    }

    # Verifica se o script está sendo executado como administrador
    if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Por favor, execute como administrador."
        Write-Host "Please run as administrator."
        exit
    }

    # Para o serviço AnyDesk
    Stop-AnyDesk

    # Exclui os arquivos de configuração do AnyDesk
    Remove-Item -Path "$env:ALLUSERSPROFILE\AnyDesk\service.conf" -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:APPDATA\AnyDesk\service.conf" -ErrorAction SilentlyContinue

    # Copia o arquivo de configuração do usuário para uma pasta temporária
    Copy-Item -Path "$env:APPDATA\AnyDesk\user.conf" -Destination "$env:TEMP\user.conf" -Force

    # Exclui todos os arquivos na pasta AnyDesk, exceto o arquivo de sessões recentes (user.conf) e o diretório de miniaturas (thumbnails)
    Get-ChildItem -Path "$env:ALLUSERSPROFILE\AnyDesk\*" | Where-Object { $_.Name -ne "user.conf" } | Remove-Item -Force -ErrorAction SilentlyContinue
    Get-ChildItem -Path "$env:APPDATA\AnyDesk\*" | Where-Object { $_.Name -notin @("user.conf", "thumbnails") } | Remove-Item -Force -ErrorAction SilentlyContinue

    # Inicia o serviço AnyDesk
    Start-AnyDesk

    # Verifica se o arquivo de configuração do sistema contém a ID do AnyDesk
    if ((Get-Content -Path "$env:ALLUSERSPROFILE\AnyDesk\system.conf") -match "ad.anynet.id=") {
        # Para o serviço AnyDesk novamente
        Stop-AnyDesk

        # Move o arquivo de configuração do usuário de volta para a pasta AnyDesk
        Move-Item -Path "$env:TEMP\user.conf" -Destination "$env:APPDATA\AnyDesk\user.conf" -Force

        # Inicia o serviço AnyDesk novamente
        Start-AnyDesk
    }

    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Reset concluído."
    Write-Host "*********"
    Write-Host "Completed!"
} else {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O AnyDesk não está instalado!"
    Write-Host "AnyDesk is not installed!"
}

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
