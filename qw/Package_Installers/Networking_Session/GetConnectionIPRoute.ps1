# GetConnectionIPRoute.ps1 - Para obter a rota de IP até a Google.com
#
# Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
# Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de obter a rota de IP até a Google.com.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-01 às 16h05, Marcos Aurélio:
#   - Versão inicial, criada a opção para obter a rota de IP até um determinado domínio.
# v0.0.2 2023-11-01 às 23h45, Marcos Aurélio:
#   - Script PowerShell que ao informar um domínio de um site, ele
#     retornará com a rota da conexão na sessão QuickWindows / Redes.
#
# Licença: GPL.

# Adjusting PowerShell window dimensions
$width = "120"
$height = "30"
$size = New-Object System.Management.Automation.Host.Size($width, $height)
$host.UI.RawUI.WindowSize = $size

$domain = Read-Host "Enter the domain of the website"
$ip = [System.Net.Dns]::GetHostAddresses($domain) | Select-Object -ExpandProperty IPAddressToString
$traceroute = Test-NetConnection -TraceRoute -ComputerName $ip
$traceroute | Select-Object -ExpandProperty TraceRoute

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

