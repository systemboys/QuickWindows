# Run_BatteryReport.ps1 - Executa o script de execução de BatteryReport.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de executar o BatteryReport.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-03-29 às 16h35, Marcos Aurélio:
#   - Versão inicial, Execução de BatteryReport.
# v1.0.1 2024-06-14 às 23h11, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 22h17, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.1 2024-07-28 às 01h45, Marcos Aurélio:
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

# ----------------------[Conteúdo do script abaixo]---------------------------

# Obtém a data e a hora atual
$dataHoraAtual = Get-Date -Format "yyyy-MM-dd_HHmmss"

# Define o nome do arquivo
$nomeArquivo = "battery-report_$dataHoraAtual.html"

# Define o caminho completo do arquivo
$caminhoArquivo = Join-Path $env:TEMP $nomeArquivo

# Executa o comando powercfg /batteryreport e gera o arquivo html
Invoke-Expression "powercfg /batteryreport /output `"$caminhoArquivo`""

# Exibe o caminho do arquivo gerado
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Relatório de bateria gerado em: $caminhoArquivo"
Write-Output "Relatório de bateria gerado em: $caminhoArquivo"

# Abre o arquivo no navegador padrão do sistema
Start-Process $caminhoArquivo

# ---------------------[/Conteúdo do script acima]---------------------------

exit
