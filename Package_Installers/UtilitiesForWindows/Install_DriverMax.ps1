# Install_DriverMax.ps1 - Executa o script de instalação de DriverMax.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-12-29 às 01h41, Sandro de Souza Silva (Servo Informática):
#   - Versão inicial, Instalação de DriverMax.
# v1.0.1 2023-12-29 às 21h34, Marcos Aurélio:
#   - Modificação onde o PowerShell pergunta onde deve salvar o download do arquivo.
# v1.0.2 2024-06-14 às 23h07, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.2 2024-06-16 às 22h03, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.1.3 2024-07-11 às 00h46, Marcos Aurélio:
#   - Ajuste na remoção do arquivo baixado em Temp, uma condição que verifica a existência do arquivo foi adicionada.
# v1.2.3 2024-07-28 às 01h32, Marcos Aurélio:
#   - Registro de logs.
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
# Importar a função
. ..\..\functions.ps1

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

# Se o DriverMax não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)\Innovative Solutions"
$directory = "$programFiles\DriverMax"

if (Test-Path $directory) {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "DriverMax está instalado!"; Write-Host "Log created in: $logPath"; clear
    Write-Host "DriverMax is installed!"
} else {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "DriverMax não está instalado! Iniciando processo de instalação."; Write-Host "Log created in: $logPath"; clear
    Write-Host "DriverMax is not installed! Starting installation process."
    Write-Host "File size: 7.01 MB"

    # Pedir ao usuário para digitar o caminho onde deseja salvar o arquivo
    do {
        $saveLocation = Read-Host "Enter the path where you want to save the file (Ex.: C:\Users\UserPC\Downloads)"

        # Verifica se o campo está vazio
        if ([string]::IsNullOrWhiteSpace($saveLocation)) {
            Write-Host "Please enter a valid path."
        }
        else {
            # Verifica se o caminho existe e é válido
            if (-not (Test-Path (Split-Path -Path $saveLocation))) {
                Write-Host "Invalid path or directory does not exist. Please enter a valid path."
            }
        }
    } until (-not [string]::IsNullOrWhiteSpace($saveLocation) -and (Test-Path (Split-Path -Path $saveLocation)))

    # Define o caminho completo para o arquivo de download
    $downloadPath = Join-Path -Path $saveLocation -ChildPath "DriverMax_setup.exe"
    
    # Faz o download do DriverMax
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/DriverMax_setup.exe"
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = $configData.beepsOnDownloads
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o DriverMax
    if (Test-Path "$env:TEMP\$downloadPath") {
        Remove-Item -Path "$env:TEMP\$downloadPath" -Force
    }
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
