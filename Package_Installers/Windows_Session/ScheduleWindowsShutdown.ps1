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
    $command = Read-Host "Shut down Windows in how many minutes?"

    $minutos = [int]$command
    $segundos = $minutos * 60

    $command = "shutdown -s -t $segundos"
    Invoke-Expression $command

    Write-Host
    Write-Host "Windows will automatically shut down in $minutos minutes..."
    Write-Host
} else {
    $resposta = Read-Host "Deseja anular o desligamento automático? (s/n)"
    if ($resposta -eq "s") {
        shutdown.exe /a
        Write-Host "Desligamento automático anulado!"
    } elseif ($resposta -eq "n") {
        Write-Host "Desligamento mantido!"
    } else {
        Write-Host "Opção inválida."
    }
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
