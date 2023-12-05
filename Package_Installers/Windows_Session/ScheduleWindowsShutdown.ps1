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

$shutdownCheck = shutdown.exe /a 2>&1

if ($shutdownCheck -like "*Nenhum desligamento pendente*") {
    Write-Host "Não há desligamento agendado!"
} else {
    Write-Host "Há um desligamento agendado!"
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
