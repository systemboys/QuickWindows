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
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
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

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
