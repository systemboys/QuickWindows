# GetLocalIPAddress.ps1 - Para obter rota de domínio
#
# Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
# Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de obter o IP local.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-01 às 15h45, Marcos Aurélio:
#   - Versão inicial, opção para obter a rota de determinado
#     domínio na Sessão de Redes.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

$ipAddress = (Get-NetIPAddress | Where-Object {$_.InterfaceAlias -eq 'Ethernet'}).IPAddress
Write-Host "Local IP Address: $ipAddress"
ipconfig
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

