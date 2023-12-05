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
$shutdown = Get-WmiObject -Class Win32_OperatingSystem | Select-Object -ExpandProperty LastBootUpTime
$shutdown = [Management.ManagementDateTimeConverter]::ToDateTime($shutdown)
$shutdown = New-TimeSpan -Start $shutdown -End (Get-Date)

if ($shutdown.TotalSeconds -lt 0) {
    Write-Host "Não há desligamento programado."
    $resposta = Read-Host "Deseja agendar um desligamento? (s/n)"
    if ($resposta -eq "s") {
        $tempo = Read-Host "Em quantos minutos você deseja desligar o Windows?"
        shutdown.exe /s /t ($tempo * 60)
        Write-Host "Desligamento programado para daqui a $tempo minutos."
    }
} else {
    $tempoRestante = [math]::Round($shutdown.TotalSeconds / 60)
    Write-Host "Há um desligamento programado para daqui a $tempoRestante minutos."
    $resposta = Read-Host "Deseja anular o desligamento? (s/n)"
    if ($resposta -eq "s") {
        shutdown.exe /a
        Write-Host "Desligamento anulado."
    }
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
