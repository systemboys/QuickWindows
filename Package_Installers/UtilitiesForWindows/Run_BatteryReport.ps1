# Run_BatteryReport.ps1 - Executa o script de execução de BatteryReport.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de executar o BatteryReport.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-03-29 às 16h35, Marcos Aurélio:
#   - Versão inicial, Execução de BatteryReport.
# v0.0.2 2024-06-14 às 23h11, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v0.0.3 2024-06-16 às 22h17, Marcos Aurélio:
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
Write-Output "Relatório de bateria gerado em: $caminhoArquivo"

# Abre o arquivo no navegador padrão do sistema
Start-Process $caminhoArquivo

# ---------------------[/Conteúdo do script acima]---------------------------

exit
