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

# Verifica se há um desligamento programado
$shutdown = Get-ScheduledTask | Where-Object {$_.TaskName -eq "Shutdown"}

if ($null -eq $shutdown) {
    Write-Host "Não há desligamento programado."
    $resposta = Read-Host "Deseja agendar um desligamento? (s/n)"
    if ($resposta -eq "s") {
        $tempo = Read-Host "Em quantos minutos você deseja desligar o Windows?"
        $action = New-ScheduledTaskAction -Execute "shutdown.exe" -Argument "/s /t 0"
        $trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes($tempo)
        Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Shutdown" -Description "Desligamento programado"
        Write-Host "Desligamento programado para daqui a $tempo minutos."
    }
} else {
    $tempoRestante = ($shutdown.Triggers.StartBoundary - (Get-Date)).TotalMinutes
    Write-Host "Há um desligamento programado para daqui a $tempoRestante minutos."
    $resposta = Read-Host "Deseja anular o desligamento? (s/n)"
    if ($resposta -eq "s") {
        Unregister-ScheduledTask -TaskName "Shutdown" -Confirm:$false
        Write-Host "Desligamento anulado."
    }
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
