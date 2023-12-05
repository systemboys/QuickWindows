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

do {
    clear
    Write-Host "0 = Exit"
    Write-Host "1 = Schedule a shutdown"
    Write-Host "2 = Cancel a shutdown"
    $input = Read-Host "Please choose an option"
    switch ($input) {
        '0' {
            exit
        }
        '1' {
            $time = Read-Host "Please enter the time in minutes for the shutdown"
            if (![string]::IsNullOrWhiteSpace($time) -and $time -match '^\d+$') {
                $seconds = [int]$time * 60
                shutdown -s -t $seconds
            } else {
                Write-Host "Invalid input. Please enter a valid number of minutes."
                Write-Host "Press any key to continue..."
                $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            }
        }
        '2' {
            shutdown -a
        }
        default {
            Write-Host "Invalid option. Please choose a valid option."
            Write-Host "Press any key to continue..."
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
    }
} while ($input -ne '0')
