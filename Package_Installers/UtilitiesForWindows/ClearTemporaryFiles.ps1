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
$windowsTempPath = "C:\Windows\Temp"
Write-Host "Clearing temporary files in: $windowsTempPath"
Remove-Item -Path $windowsTempPath\* -Force -Recurse

# Limpar diretório %temp% do usuário
$userTempPath = [System.IO.Path]::GetTempPath()
Write-Host "Clearing temporary files in: $userTempPath"
Remove-Item -Path $userTempPath\* -Force -Recurse

# Mensagem de conclusão
Write-Host "Temporary file cleanup complete."

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
