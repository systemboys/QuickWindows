# Install_FoxitPDFReader.ps1 - Executa o script de instalação de Foxit PDF Reader.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-01-25 às 20h11, Marcos Aurélio:
#   - Versão inicial, Instalação de Foxit PDF Reader.
# v0.0.2 2024-06-14 às 23h08, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v0.0.3 2024-06-16 às 22h03, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
#
# Licença: GPL.

# Configurações
$configData = Get-Content -Path "./config.json" | ConvertFrom-Json

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size($configData.PowerShellTerminalWidth, $configData.PowerShellTerminalHeight)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o Foxit PDF Reader não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)\Foxit Software\"
$directory = "$programFiles\Foxit PDF Reader"

if (Test-Path $directory) {
    Write-Host "Foxit PDF Reader is installed!"
} else {
    Write-Host "Foxit PDF Reader is not installed! Starting installation process."
    Write-Host "File size: 153.0 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://public.bl.files.1drv.com/y4mhXxb-H_Z4V8uDytwQSgzG5ccbk1mYgPPa3vtO81Xb5uAZR8d08ePkFHk91e6IJc5pMT5vAYohY2naeGXcBiO89TPQIba35N4-C543Zod9cIYxynjIMvWkKH4Dh5lpsGqC3uqe4vLCNCZZZAX7x2_tu4jqzB66A69XsE0Tg3Q87uJGBzfUyXUIWS_ynRImLV8OdmECfv7pK01tN_qEXxuVqCtysU-gA35FPvU3qiMhY4?AVOverride=1"
    $downloadPath = "$env:temp\FoxitPDFReader20233_L10N_Setup_Prom.exe"
    
    # Faz o download do Foxit PDF Reader
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = $configData.beepsOnDownloads
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o Foxit PDF Reader
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
