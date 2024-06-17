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
# v0.0.2 2024-06-14 às 23h02, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v0.0.3 2024-06-16 às 23h07, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
#
# Licença: GPL.

# Configurações
$configData = Get-Content -Path "./config.json" | ConvertFrom-Json

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size($configData.PowerShellTerminalWidth, $configData.PowerShellTerminalHeight)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

$ipAddress = Invoke-RestMethod -Uri "https://api.ipify.org?format=json" | Select-Object -ExpandProperty ip
Write-Host "Public IP Address: $ipAddress"
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

