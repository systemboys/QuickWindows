# Install_WinZip.ps1 - Executa o script de instalação de WinZip.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-11-30 às 00h46, Marcos Aurélio:
#   - Versão inicial, Instalação de WinZip.
# v1.0.1 2023-12-06 às 21h00, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
# v1.0.2 2024-06-14 às 23h11, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.2 2024-06-16 às 22h14, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
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

# Se o WinZip não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\WinZip"

if (Test-Path $directory) {
    Write-Host "WinZip is installed!"
} else {
    Write-Host "WinZip is not installed! Starting installation process."
    Write-Host "File size: 2.8 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/WinZip.exe"
    $downloadPath = "$env:temp\WinZip.exe"
    
    # Faz o download do WinZip
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath
    
    # Instala o WinZip
    Start-Process -FilePath "$downloadPath" -Wait

    # Emitir Sequência de Beeps
    $numeroDeBeeps = $configData.beepsOnDownloads
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
