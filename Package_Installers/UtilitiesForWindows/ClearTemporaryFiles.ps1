# ClearTemporaryFiles.ps1 - Executa o script que limpa os arquivos temporários do Windows.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de apagar os arquivos temporários do Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-01-15 às 19h18, Marcos Aurélio:
#   - Versão inicial, Opção que limpa os arquivos temporários do diretório C:\Windows\Temp e %temp% do usuário.
# v1.0.1 2024-01-19 às 01h08, Marcos Aurélio:
#   - Alteração que mostra a quantidade de arquivos temporários foram apagados.
# v1.0.2 2024-06-14 às 23h04, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.2 2024-06-16 às 02h05, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.2 2024-07-28 às 01h09, Marcos Aurélio:
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

# Mensagem de início
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Iniciando a limpeza dos arquivos temporários..."
Write-Host "Starting cleaning temporary files..."

# Inicializar a contagem de arquivos apagados
$deletedFilesCount = 0

# Limpar diretório C:\Windows\Temp
$windowsTempPath = "$env:Windir\Temp"
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Limpando arquivos temporários em: $windowsTempPath"
Write-Host "Clearing temporary files in: $windowsTempPath"
Get-ChildItem -Path $windowsTempPath | Where-Object { $_.FullName -notlike "*\QuickWindows\*" } | ForEach-Object {
    try {
        Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Arquivo excluído: $($_.FullName)"
        Write-Host "Deleted file: $($_.FullName)"
        $deletedFilesCount++
    } catch {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Erro ao excluir arquivo: $($_.FullName). $($_.Exception.Message)"
        Write-Host "Error deleting file: $($_.FullName). $($_.Exception.Message)"
    }
}

# Limpar diretório %temp% do usuário, excluindo o diretório QuickWindows
$userTempPath = [System.IO.Path]::GetTempPath()
$quickWindowsPath = Join-Path $userTempPath "QuickWindows"
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Limpando arquivos temporários em: $userTempPath, exceto $quickWindowsPath"
Write-Host "Clearing temporary files in: $userTempPath, except $quickWindowsPath"
Get-ChildItem -Path $userTempPath | Where-Object { $_.FullName -ne $quickWindowsPath } | ForEach-Object {
    try {
        Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Arquivo excluído: $($_.FullName)"
        Write-Host "Deleted file: $($_.FullName)"
        $deletedFilesCount++
    } catch {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Erro ao excluir arquivo: $($_.FullName). $($_.Exception.Message)"
        Write-Host "Error deleting file: $($_.FullName). $($_.Exception.Message)"
    }
}

# Mensagem de conclusão com o número de arquivos apagados
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Limpeza de arquivo temporário concluída. Arquivos $deletedFilesCount excluídos."
Write-Host "Temporary file cleanup complete. Deleted $deletedFilesCount files."

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
