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

# Se o ScheduleWindowsShutdown não estiver instalado, faz o download e instala

$command = Read-Host "Shut down Windows in how many minutes?"

$minutos = [int]$command
$segundos = $minutos * 60

$command = "shutdown -s -t $segundos"
Invoke-Expression $command

Write-Host "Windows will automatically shut down in $minutos minutes..."
Write-Host
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
