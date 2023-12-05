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

# Obter todas as tarefas agendadas
$tasks = Get-ScheduledTask | Where-Object {$_.State -ne 'Disabled'}

# Filtrar para encontrar a tarefa de desligamento
$shutdownTask = $tasks | Where-Object {$_.Actions.Execute -eq 'C:\Windows\System32\shutdown.exe'}

if ($shutdownTask -ne $null) {
    Write-Output "Desligamento agendado encontrado: $($shutdownTask.TaskName)"
} else {
    Write-Output "Nenhum desligamento agendado encontrado."
}


Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
