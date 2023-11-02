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
#   - Versão inicial, criada a opção para obter a rota de IP até a Google.com.
#
# Licença: GPL.

$ipRoute = Test-NetConnection -ComputerName google.com -TraceRoute
$ipRoute.Hops | ForEach-Object {
    Write-Output $_.IPAddress
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

