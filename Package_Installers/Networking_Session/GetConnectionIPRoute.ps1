# GetConnectionIPRoute.ps1 - Para obter a rota de IP até a Google.com
#
# Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
# Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de obter a rota de IP até a Google.com.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-11-01 às 16h05, Marcos Aurélio:
#   - Versão inicial, criada a opção para obter a rota de IP até um determinado domínio.
# v1.1.0 2023-11-01 às 23h45, Marcos Aurélio:
#   - Script PowerShell que ao informar um domínio de um site, ele
#     retornará com a rota da conexão na sessão QuickWindows / Redes.
# v1.1.1 2024-06-14 às 23h01, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.2.1 2024-06-16 às 23h07, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.3.1 2024-07-28 às 00h33, Marcos Aurélio:
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

# Importa a função do caminho encontrado
. $functionPath

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Digite o domínio do site."
$domain = Read-Host "Enter the domain of the website"
$ip = [System.Net.Dns]::GetHostAddresses($domain) | Select-Object -ExpandProperty IPAddressToString
$traceroute = Test-NetConnection -TraceRoute -ComputerName $ip
$traceroute | Select-Object -ExpandProperty TraceRoute

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

