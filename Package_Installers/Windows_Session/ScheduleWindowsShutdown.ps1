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
# v0.0.2 2024-06-14 às 23h15, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
#
# Licença: GPL.

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size(120, 30)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

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
