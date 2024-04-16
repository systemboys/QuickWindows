# RemoveQuickWindows.ps1 - Executa o script de remoção do QuickWindows.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar a execução de comandos Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-04-16 às 19h49, Marcos Aurélio:
#   - Versão inicial, remoção do QuickWindows.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# ----------------------[Conteúdo do script abaixo]---------------------------

# Sair do diretório
cd .. ; cd .. ; cd ..

# Variáveis de ambiente
$UserPath = [Environment]::GetFolderPath("Desktop")
$ShortcutPath = Join-Path -Path $UserPath -ChildPath "GTi Support.lnk"
# $DirectoryPath = Join-Path -Path $env:temp -ChildPath "QuickWindows"

# Remover o atalho
if (Test-Path -Path $ShortcutPath) {
    Remove-Item -Path $ShortcutPath -Force
}

# Remover o diretório
# if (Test-Path -Path $DirectoryPath) {
#     Remove-Item -Path $DirectoryPath -Recurse -Force
# }

# Mensagem de sucesso
Write-Output "Successfully removed QuickWindows."

# Fechar todas as janelas do PowerShell
# Stop-Process -Name powershell -Force

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
