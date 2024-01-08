# UpdatingSoftwareInWindows.ps1 - Executa o script que atualiza os softwares no Windows.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de atualizar os softwares no Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-12 às 17h10, Marcos Aurélio:
#   - Versão inicial, atualizar os softwares no Windows.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Executar as atualizações do Windows
Install-Module PSWindowsUpdate -Force
Get-WindowsUpdate -AcceptAll -Install

# Atualizar softwares no Windows.
winget upgrade --all

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
