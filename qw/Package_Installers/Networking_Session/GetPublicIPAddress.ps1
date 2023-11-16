# GetPublicIPAddress.ps1 - Para obter o IP público
#
# Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
# Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de obter o IP público.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-01 às 08h30, Marcos Aurélio:
#   - Versão inicial, criada a opção para obter IP público na Sessão de Redes.
#
# Licença: GPL.

$ipAddress = Invoke-RestMethod -Uri "https://api.ipify.org?format=json" | Select-Object -ExpandProperty ip
Write-Host "Public IP Address: $ipAddress"
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

