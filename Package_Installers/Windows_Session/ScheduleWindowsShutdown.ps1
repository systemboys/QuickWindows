# ScheduleWindowsShutdown.ps1 - Executa o script de ScheduleWindowsShutdown.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar agendamento de desligamento do Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-12-05 às 14h45, Marcos Aurélio:
#   - Versão inicial, agendamento de desligamento do Windows.
# v1.0.1 2024-06-14 às 23h15, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.2.1 2024-06-16 às 22h40, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.3.1 2024-07-28 às 11h12, Marcos Aurélio:
#   - Registro de logs.
#
# Licença: GPL.

# Configurações
# Tenta encontrar o arquivo config.json na pasta raiz
$configPath = "./config.json"
# Verifica se o arquivo existe no caminho atual
if (-not (Test-Path $configPath)) {
    # Se não existir, tenta o caminho relativo
    $configPath = "../../config.json"
}
# Importa as configurações do arquivo encontrado
$configData = Get-Content -Path $configPath | ConvertFrom-Json

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size($configData.PowerShellTerminalWidth, $configData.PowerShellTerminalHeight)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

# ------Importação da função e configuração de endereço e arquivo para Registrar log------
# Tentativa de importar a função a partir de diferentes caminhos
# Primeiro caminho (subindo dois níveis)
$functionPath = "..\..\functions.ps1"

# Verifica se o arquivo existe no primeiro caminho
if (-not (Test-Path $functionPath)) {
    # Se não existir, tenta o caminho alternativo (nível zero)
    $functionPath = ".\functions.ps1"
}

# Importa a função do caminho encontrado
. $functionPath

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

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
            $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Por favor, insira o tempo em minutos para o desligamento."; Write-Host "Log created in: $logPath"; clear
            $time = Read-Host "Please enter the time in minutes for the shutdown"
            if (![string]::IsNullOrWhiteSpace($time) -and $time -match '^\d+$') {
                $seconds = [int]$time * 60
                shutdown -s -t $seconds
            } else {
                $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Entrada inválida. Insira um número válido de minutos."; Write-Host "Log created in: $logPath"; clear
                Write-Host "Invalid input. Please enter a valid number of minutes."
                Write-Host "Press any key to continue..."
                $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            }
        }
        '2' {
            shutdown -a
        }
        default {
            $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Opção inválida. Por favor, escolha uma opção válida."; Write-Host "Log created in: $logPath"; clear
            Write-Host "Invalid option. Please choose a valid option."
            Write-Host "Press any key to continue..."
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
    }
} while ($input -ne '0')
