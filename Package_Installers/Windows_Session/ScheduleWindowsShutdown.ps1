# ScheduleWindowsShutdown.ps1 - Executa o script de ScheduleWindowsShutdown.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar agendamento de desligamento do Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-12-05 às 14h45, Marcos Aurélio:
#   - Versão inicial, agendamento de desligamento do Windows.
#
# Licença: GPL.

# Verifica se um desligamento foi agendado
$shutdownScheduled = (schtasks /query /TN "Microsoft\Windows\Shutdown" | Select-String "Pronto").Count -gt 0

# Define a variável com base no resultado
if ($shutdownScheduled) {
    $shutdownVariable = 1
} else {
    $shutdownVariable = 0
}

# Imprime o valor da variável
Write-Output $shutdownVariable

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
