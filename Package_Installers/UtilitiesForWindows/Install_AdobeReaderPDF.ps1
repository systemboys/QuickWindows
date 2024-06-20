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

# Se o Adobe Reader não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files\Adobe\Acrobat DC"
$directory = "$programFiles\Acrobat"

if (Test-Path $directory) {
    Write-Host "Adobe Reader is installed!"
} else {
    Write-Host "Adobe Reader is not installed! Starting installation process."
    Write-Host "File size: 1.2 MB"

    # Link do download e o diretório Temp
    # Verifica a versão do sistema operacional
    $osVersion = (Get-WmiObject -Class Win32_OperatingSystem).Version

    # Verifica se o sistema operacional é Windows 10 ou 11
    if ($osVersion -like "10.*") {
        $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/readerdc64_br_xa_mdr_install_win10_64bits.exe"
        $downloadPath = "$env:temp\readerdc64_br_xa_mdr_install_win10_64bits.exe"
    } elseif ($osVersion -like "11.*") {
        $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/readerdc64_br_xa_mdr_install_win11_64bits.exe"
        $downloadPath = "$env:temp\readerdc64_br_xa_mdr_install_win11_64bits.exe"
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
    # Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
