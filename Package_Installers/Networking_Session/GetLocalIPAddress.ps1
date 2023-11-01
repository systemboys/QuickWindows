# Menu_QuickWindows.bat - Para obter IP local na Sessão de Redes
#
# Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
# Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de obter o IP local.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-01 às 15h45, Marcos Aurélio:
#   - Versão inicial, criada a opção para obter IP local na Sessão de Redes.
#
# Licença: GPL.

$ipAddress = (Get-NetIPAddress | Where-Object {$_.InterfaceAlias -eq 'Ethernet'}).IPAddress
Write-Host "Local IP Address: $ipAddress"
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

