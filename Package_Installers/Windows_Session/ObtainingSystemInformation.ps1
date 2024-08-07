# ObtainingSystemInformation.ps1 - Executa o script de Obter informações do Sistema via comando.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-02-04 às 23h06, Marcos Aurélio:
#   - Versão inicial, Obter informações do Sistema via comando.
# v1.0.1 2024-06-14 às 23h14, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 22h42, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.1 2024-07-28 às 11h09, Marcos Aurélio:
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

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Informações do sistema."

# Função para exibir informações em um quadro
function Show-InfoFrame {
    param(
        [string]$title,
        [string]$content
    )

    Write-Host ("_" * 100)
    Write-Host ("{0,-100}" -f $title)
    Write-Host ("{0,-100}" -f $content)
}

# Obter informações do processador
$processorInfo = Get-WmiObject -Class Win32_Processor | Select-Object Name, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
$processorContent = "Name: $($processorInfo.Name)", "Max Clock Speed: $($processorInfo.MaxClockSpeed) MHz", "Cores: $($processorInfo.NumberOfCores)", "Logical Processors: $($processorInfo.NumberOfLogicalProcessors)"

# Obter informações de memória
$memoryInfo = Get-WmiObject -Class Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
$memoryContent = "Total Physical Memory: {0:N2} GB" -f ($memoryInfo.Sum)

# Obter informações gerais do sistema
$systemInfo = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object Manufacturer, Model, TotalPhysicalMemory
$systemContent = "Manufacturer: $($systemInfo.Manufacturer)", "Model: $($systemInfo.Model),", "Total Physical Memory: {0:N2} GB" -f ($systemInfo.TotalPhysicalMemory / 1GB)

# Exibir informações em quadros
Show-InfoFrame -title "Processor Info" -content ($processorContent -join "`n")
Show-InfoFrame -title "Memory Info" -content $memoryContent
Show-InfoFrame -title "System Info" -content ($systemContent -join "`n")

Write-Host ("_" * 100)

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
