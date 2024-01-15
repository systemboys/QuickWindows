# Install_YourPackage.ps1 - Executa o script de instalação de YourPackage.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-10-31 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação de YourPackage.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o YourPackage não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\YourPackage"

# Mensagem de início
Write-Host "Iniciando o processo de limpeza do Spooler de Impressão..."

# Parar o serviço de spooler
Write-Host "Parando o serviço de Spooler de Impressão..."
Stop-Service -Name Spooler -Force

# Remover arquivos temporários
$shdPath = "$env:systemroot\system32\spool\PRINTERS\*.SHD"
$splPath = "$env:systemroot\system32\spool\PRINTERS\*.SPL"

Write-Host "Removendo arquivos temporários: $shdPath, $splPath"
Remove-Item -Path $shdPath -Force -Recurse
Remove-Item -Path $splPath -Force -Recurse

# Iniciar o serviço de spooler
Write-Host "Iniciando o serviço de Spooler de Impressão..."
Start-Service -Name Spooler

# Mensagem de conclusão
Write-Host "Limpeza do Spooler de Impressão concluída."

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
