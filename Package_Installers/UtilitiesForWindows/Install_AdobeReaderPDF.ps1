# Install_AdobeReaderPDF.ps1 - Executa o script de instalação de Adobe Reader.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-11-29 às 13h51, Marcos Aurélio:
#   - Versão inicial, Instalação de AdobeReaderPDF.
# v1.0.1 2023-12-06 às 21h01, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
# v1.0.2 2024-06-14 às 23h05, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.2 2024-06-16 às 21h52, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.1.3 2024-06-20 às 12h12, Marcos Aurélio:
#   - A linha a qual remove o arquivo de instalação do Adobe Reader foi comentada, não é
#     necessário apagá-lo por que o próprio instalador após instalação do Adobe Reader o
#     apaga.
# v1.1.4 2024-07-11 às 00h46, Marcos Aurélio:
#   - Ajuste na remoção do arquivo baixado em Temp, uma condição que verifica a existência do arquivo foi adicionada.
# v1.1.5 2024-07-24 às 01h47, Marcos Aurélio:
#   - Ajuste para finalização dos Processos do Adobe no PowerShell para Continuação de Scripts.
# v1.1.5 2024-07-24 às 01h47, Marcos Aurélio:
#   - Atualização do arquivo de instalação do Adobe da versão do Windows 10.
# v1.2.5 2024-07-28 às 01h24, Marcos Aurélio:
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
# Tentativa de importar a função a partir de diferentes caminhos
# Primeiro caminho (subindo dois níveis)
$functionPath = "..\..\functions.ps1"

# Verifica se o arquivo existe no primeiro caminho
if (-not (Test-Path $functionPath)) {
    # Se não existir, tenta o caminho alternativo (nível zero)
    $functionPath = ".\functions.ps1"
}

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

# Se o Adobe Reader não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)\Adobe\Acrobat Reader DC"
$directory = "$programFiles\Reader"

if (Test-Path $directory) {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O Adobe Reader está instalado!"; Write-Host "Log created in: $logPath"; clear
    Write-Host "Adobe Reader is installed!"
} else {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O Adobe Reader não está instalado! Iniciando processo de instalação."; Write-Host "Log created in: $logPath"; clear
    Write-Host "Adobe Reader is not installed! Starting installation process."

    # Link do download e o diretório Temp
    # Verifica a versão do sistema operacional
    $osVersion = (Get-WmiObject -Class Win32_OperatingSystem).Version

    # Verifica se o sistema operacional é Windows 10 ou 11
    if ($osVersion -like "10.*") {
        Write-Host "File size: 289 MB"
        $downloadUrl = "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2400220759/AcroRdrDC2400220759_pt_BR.exe"
        $downloadPath = "$env:temp\AcroRdrDC2400220759_pt_BR.exe"
    } elseif ($osVersion -like "11.*") {
        Write-Host "File size: 289 MB"
        $downloadUrl = "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2400220759/AcroRdrDC2400220759_pt_BR.exe"
        $downloadPath = "$env:temp\AcroRdrDC2400220759_pt_BR.exe"
    } else {
        Write-Host "The operating system is not Windows 10 or 11."
    }
    
    # Faz o download do Adobe Reader
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = $configData.beepsOnDownloads
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o Adobe Reader
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    if (Test-Path "$env:TEMP\$downloadPath") {
        Remove-Item -Path "$env:TEMP\$downloadPath" -Force
    }

    # Array com os nomes dos processos que deseja finalizar
    $processNames = @(
        "AcroRd32",
        "AdobeARM",
        "Acrobat",
        "armsvc"
    )

    # Loop para finalizar cada processo do array
    foreach ($processName in $processNames) {
        Get-Process -Name $processName -ErrorAction SilentlyContinue | Stop-Process -Force
    }

    # Coloque aqui os comandos que você deseja executar após finalizar os processos
    Write-Host "Processes completed. Continuing with the rest of the script..."
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
