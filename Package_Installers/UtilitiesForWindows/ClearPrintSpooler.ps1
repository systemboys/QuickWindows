# ClearPrintSpooler.ps1 - Executa o script que limpa o spooler de impressão do Windows
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de limpar o spooler de impressão do Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-01-15 às 19h22, Marcos Aurélio:
#   - Versão inicial, Opção que para o serviço de spooler de impressão, limpa os arquivos temporários e reinicia o serviço na sessão 'Utilitários para Windows'.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o YourPackage não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\YourPackage"

# Mensagem de início
Write-Host "Starting the Print Spooler cleaning process..."

# Parar o serviço de spooler
Write-Host "Stopping the Print Spooler service..."
Stop-Service -Name Spooler -Force

# Remover arquivos temporários
$shdPath = "$env:systemroot\system32\spool\PRINTERS\*.SHD"
$splPath = "$env:systemroot\system32\spool\PRINTERS\*.SPL"

Write-Host "Removing temporary files: $shdPath, $splPath"
Remove-Item -Path $shdPath -Force -Recurse
Remove-Item -Path $splPath -Force -Recurse

# Iniciar o serviço de spooler
Write-Host "Starting the Print Spooler service..."
Start-Service -Name Spooler

# Mensagem de conclusão
Write-Host "Print Spooler Cleanup Complete."

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
