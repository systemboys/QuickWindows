# UpdateQuickWindows.ps1 - Executa o script de atualização do QuickWindows.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de atualizar o QuickWindows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-07-27 às 18h21, Marcos Aurélio:
#   - Versão inicial, Atualização do QuickWindows.
#
# Licença: GPL.

# Configurações
# Tenta encontrar o arquivo config.json na pasta raiz
$configPath = "./config.json"
# Verifica se o arquivo existe no caminho atual
if (-not (Test-Path $configPath)) {
    # Se não existir, tenta o caminho relativo
    $configPath = "../../config.json"
}
# Importa as configurações do arquivo encontrado
$configData = Get-Content -Path $configPath | ConvertFrom-Json

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size($configData.PowerShellTerminalWidth, $configData.PowerShellTerminalHeight)

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

# ----------------------[Conteúdo do script abaixo]---------------------------

# Remove o diretório QuickWindows e seu conteúdo, se existir
if (Test-Path "QuickWindows") {
    Remove-Item -Recurse -Force "QuickWindows"
}

# Clona o repositório QuickWindows do GitHub
git clone https://github.com/systemboys/QuickWindows.git

# Navega para o diretório QuickWindows
Set-Location -Path "QuickWindows"

# Executa o script QuickWindows.cmd com o argumento 0
Start-Process -FilePath "QuickWindows.cmd" -ArgumentList "0" -Wait

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
