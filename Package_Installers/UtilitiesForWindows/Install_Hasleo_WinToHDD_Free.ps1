# Install_Hasleo_WinToHDD_Free.ps1 - Executa o script de instalação de Hasleo WinToHDD Free.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-11-29 às 10h50, Marcos Aurélio:
#   - Versão inicial, Instalação de Hasleo WinToHDD Free.
# v1.0.1 2023-12-06 às 21h00, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
# v1.0.2 2024-06-14 às 23h08, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.2 2024-06-16 às 22h05, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.1.3 2024-07-11 às 00h46, Marcos Aurélio:
#   - Ajuste na remoção do arquivo baixado em Temp, uma condição que verifica a existência do arquivo foi adicionada.
# v1.2.3 2024-07-28 às 01h34, Marcos Aurélio:
#   - Registro de logs.
# v1.3.3 2024-07-31 às 23h55, Marcos Aurélio:
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
$Install_Hasleo_WinToHDD_Free = $urlsData.UtilitiesForWindows[10] # Acessa a URL do pacote

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

# Se o Hasleo WinToHDD Free não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files\Hasleo"
$directory = "$programFiles\WinToUSB"

if (Test-Path $directory) {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Hasleo WinToHDD Free está instalado!"
    Write-Host "Hasleo WinToHDD Free is installed!"
} else {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Hasleo WinToHDD Free não está instalado! Iniciando processo de instalação."
    Write-Host "Hasleo WinToHDD Free is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = $Install_Hasleo_WinToHDD_Free
    $downloadPath = "$env:temp\WinToHDD.exe"
    
    # Faz o download do WinToHDD
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = $configData.beepsOnDownloads
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o WinToHDD
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    if (Test-Path "$env:TEMP\$downloadPath") {
        Remove-Item -Path "$env:TEMP\$downloadPath" -Force
    }
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
