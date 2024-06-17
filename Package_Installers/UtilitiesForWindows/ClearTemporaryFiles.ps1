# ClearTemporaryFiles.ps1 - Executa o script que limpa os arquivos temporários do Windows.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de apagar os arquivos temporários do Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-01-15 às 19h18, Marcos Aurélio:
#   - Versão inicial, Opção que limpa os arquivos temporários do diretório C:\Windows\Temp e %temp% do usuário.
# v0.0.2 2024-01-19 às 01h08, Marcos Aurélio:
#   - Alteração que mostra a quantidade de arquivos temporários foram apagados.
# v0.0.3 2024-06-14 às 23h04, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v0.0.4 2024-06-16 às 02h05, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
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

# Mensagem de início
Write-Host "Starting cleaning temporary files..."

# Inicializar a contagem de arquivos apagados
$deletedFilesCount = 0

# Limpar diretório C:\Windows\Temp
$windowsTempPath = "$env:Windir\Temp"
Write-Host "Clearing temporary files in: $windowsTempPath"
Get-ChildItem -Path $windowsTempPath | Where-Object { $_.FullName -notlike "*\QuickWindows\*" } | ForEach-Object {
    try {
        Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
        Write-Host "Deleted file: $($_.FullName)"
        $deletedFilesCount++
    } catch {
        Write-Host "Error deleting file: $($_.FullName). $($_.Exception.Message)"
    }
}

# Limpar diretório %temp% do usuário, excluindo o diretório QuickWindows
$userTempPath = [System.IO.Path]::GetTempPath()
$quickWindowsPath = Join-Path $userTempPath "QuickWindows"
Write-Host "Clearing temporary files in: $userTempPath, except $quickWindowsPath"
Get-ChildItem -Path $userTempPath | Where-Object { $_.FullName -ne $quickWindowsPath } | ForEach-Object {
    try {
        Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
        Write-Host "Deleted file: $($_.FullName)"
        $deletedFilesCount++
    } catch {
        Write-Host "Error deleting file: $($_.FullName). $($_.Exception.Message)"
    }
}

# Mensagem de conclusão com o número de arquivos apagados
Write-Host "Temporary file cleanup complete. Deleted $deletedFilesCount files."

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
