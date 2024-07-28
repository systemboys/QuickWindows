# ClearPrintSpooler.ps1 - Executa o script que limpa o spooler de impressão do Windows
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de limpar o spooler de impressão do Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-01-15 às 19h22, Marcos Aurélio:
#   - Versão inicial, Opção que para o serviço de spooler de impressão, limpa os arquivos temporários e reinicia o serviço na sessão 'Utilitários para Windows'.
# v1.0.1 2024-06-14 às 23h04, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 02h02, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.1 2024-07-28 às 01h06, Marcos Aurélio:
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
# Importar a função
. ..\..\functions.ps1

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

# Mensagem de início
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Iniciando o processo de limpeza do spooler de impressão..."; Write-Host "Log created in: $logPath"
Write-Host "Starting the Print Spooler cleaning process..."

# Parar o serviço de spooler
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Parando o serviço Spooler de impressão..."; Write-Host "Log created in: $logPath"
Write-Host "Stopping the Print Spooler service..."
Stop-Service -Name Spooler -Force

# Remover arquivos temporários
$shdPath = "$env:systemroot\system32\spool\PRINTERS\*.SHD"
$splPath = "$env:systemroot\system32\spool\PRINTERS\*.SPL"

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Removendo arquivos temporários: $shdPath, $splPath"; Write-Host "Log created in: $logPath"
Write-Host "Removing temporary files: $shdPath, $splPath"
Remove-Item -Path $shdPath -Force -Recurse
Remove-Item -Path $splPath -Force -Recurse

# Iniciar o serviço de spooler
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Iniciando o serviço Spooler de impressão..."; Write-Host "Log created in: $logPath"
Write-Host "Starting the Print Spooler service..."
Start-Service -Name Spooler

# Mensagem de conclusão
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Limpeza do spooler de impressão concluída."; Write-Host "Log created in: $logPath"
Write-Host "Print Spooler Cleanup Complete."

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
