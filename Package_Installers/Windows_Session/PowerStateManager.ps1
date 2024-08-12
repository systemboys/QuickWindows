# PowerStateManager.ps1 - Executa o script de execução de Gerenciador de Energia.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar a execução de comandos no Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-04-16 às 00h43, Marcos Aurélio:
#   - Versão inicial, execução de Gerenciador de Energia (Desligar ou Reiniciar).
# v1.0.1 2024-06-14 às 23h14, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 22h40, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.1 2024-07-28 às 11h10, Marcos Aurélio:
#   - Registro de logs.
# v1.3.1 2024-08-12 às 20h10, Marcos Aurélio:
#   - Opção para Acesso ao Setup da BIOS via PowerShell.
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

# ----------------------[Conteúdo do script abaixo]---------------------------

if ($args.Count -eq 0) {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Nenhum argumento fornecido. Use 1 para desligar o computador e 2 para reiniciar."
    Write-Host "No argument provided. Use 1 to turn off the computer and 2 to restart."
} else {
    $argument = $args[0]
    if ($argument -eq 1) {
        Stop-Computer -Force
    } elseif ($argument -eq 2) {
        Restart-Computer -Force
    } elseif ($argument -eq 3) {
        Start-Process "shutdown" -ArgumentList "/r /fw /t 00" # A mesma coisa de "shutdown /r /fw /t 00"
    } else {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Argumento desconhecido. Use 1 para desligar o computador e 2 para reiniciar."
        Write-Host "Unknown argument. Use 1 to turn off the computer and 2 to restart."
    }
}

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
