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
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Mensagem de início
Write-Host "Starting cleaning temporary files..."

# Limpar diretório C:\Windows\Temp
$windowsTempPath = "$env:Windir\Temp"
Write-Host "Clearing temporary files in: $windowsTempPath"
Get-ChildItem -Path $windowsTempPath | Where-Object { $_.FullName -notlike "*\QuickWindows\*" } | ForEach-Object {
    try {
        Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
        Write-Host "Deleted file: $($_.FullName)"
    } catch {
        Write-Host "Error deleting file: $($_.FullName). $($_.Exception.Message)"
    }
}

# Limpar diretório %temp% do usuário, excluindo o diretório QuickWindows
$userTempPath = [System.IO.Path]::GetTempPath()
$quickWindowsPath = Join-Path $userTempPath "QuickWindows"
Write-Host "Clearing temporary files in: $userTempPath, exceto $quickWindowsPath"
Get-ChildItem -Path $userTempPath | Where-Object { $_.FullName -ne $quickWindowsPath } | ForEach-Object {
    try {
        Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
        Write-Host "Deleted file: $($_.FullName)"
    } catch {
        Write-Host "Error deleting file: $($_.FullName). $($_.Exception.Message)"
    }
}

# Mensagem de conclusão
Write-Host "Temporary file cleanup complete."

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
