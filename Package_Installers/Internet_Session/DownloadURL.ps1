# Install_YourPackage.ps1 - Executa o script de instalação de YourPackage.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-12-10 às 23h12, Marcos Aurélio:
#   - Versão inicial, Opção para colocar URL e iniciar download direto a partir do Windows PowerShell na sessão 'Internet / Downloads'.
# v1.0.1 2024-06-14 às 22h54, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 23h12, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.1 2024-07-27 às 23h54, Marcos Aurélio:
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

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Download de arquivos a partir de uma URL."; Write-Host "Log created in: $logPath"; clear

$validInput = $false

while (-not $validInput) {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Insira o URL:"; Write-Host "Log created in: $logPath"; clear
    Write-Host "Enter the URL:"
    $url = Read-Host

    if (![string]::IsNullOrWhiteSpace($url)) {
        $validInput = $true
    } else {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "URL é obrigatório. Insira uma URL válida."; Write-Host "Log created in: $logPath"; clear
        Write-Host "URL is mandatory. Please enter a valid URL."
    }
}

$validInput = $false

while (-not $validInput) {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Insira o destino:"; Write-Host "Log created in: $logPath"; clear
    Write-Host "Enter destination:"
    $dest = Read-Host

    if (![string]::IsNullOrWhiteSpace($dest)) {
        $validInput = $true
    } else {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O destino é obrigatório. Insira um destino válido."; Write-Host "Log created in: $logPath"; clear
        Write-Host "Destination is mandatory. Please enter a valid destination."
    }
}

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Iniciando download..."; Write-Host "Log created in: $logPath"; clear
Write-Host "Starting download..."
Start-BitsTransfer -Source $url -Destination $dest

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Transferência concluída!"; Write-Host "Log created in: $logPath"; clear
Write-Host "Download completed!"

# Emitir Sequência de Beeps
$numeroDeBeeps = $configData.beepsOnDownloads
for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
    [Console]::Beep(500, 300)
    Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
