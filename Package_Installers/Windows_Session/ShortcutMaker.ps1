# ShortcutMaker.ps1 - Executa o script de instalação de Shortcut Maker.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar a criação de atalhos no Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-10-31 às 01h10, Marcos Aurélio:
#   - Versão inicial, criar dois atalhos na Área de trabalho do Windows (Desligar e Reiniciar).
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# ----------------------[Conteúdo do script abaixo]---------------------------

# ----------------- DESLIGAR -----------------
# Comando a ser executado
$command = "shutdown -s -t 00"

# Caminho do Desktop
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory)

# Nome do atalho
$shortcutName = "Desligar computador"

# Caminho completo para o atalho
$shortcutPath = Join-Path -Path $desktopPath -ChildPath "$shortcutName.lnk"

# URL do ícone
$iconUrl = "https://raw.githubusercontent.com/systemboys/_GTi_Support_/main/icons/buttons/button-icon-png-21067-Windows.ico"

# Caminho local para salvar o ícone
$iconPath = "$env:USERPROFILE\GTiSupport\button-icon-png-21067-Windows.ico"

# Baixar o ícone
Invoke-WebRequest -Uri $iconUrl -OutFile $iconPath

# Criar um objeto WScript.Shell
$shell = New-Object -ComObject WScript.Shell

# Criar atalho
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-Command `"$command`""
$shortcut.IconLocation = $iconPath
$shortcut.Description = "Desligar o computador"
$shortcut.Save()

Write-Host "Atalho criado em: $shortcutPath"

# ----------------- REINICIAR -----------------
# Comando a ser executado
$command = "shutdown -r -t 00"

# Caminho do Desktop
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory)

# Nome do atalho
$shortcutName = "Reiniciar computador"

# Caminho completo para o atalho
$shortcutPath = Join-Path -Path $desktopPath -ChildPath "$shortcutName.lnk"

# URL do ícone
$iconUrl = "https://raw.githubusercontent.com/systemboys/_GTi_Support_/main/icons/buttons/restart-icon-32273-Windows.ico"

# Caminho local para salvar o ícone
$iconPath = "$env:USERPROFILE\GTiSupport\restart-icon-32273-Windows.ico"

# Baixar o ícone
Invoke-WebRequest -Uri $iconUrl -OutFile $iconPath

# Criar um objeto WScript.Shell
$shell = New-Object -ComObject WScript.Shell

# Criar atalho
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-Command `"$command`""
$shortcut.IconLocation = $iconPath
$shortcut.Description = "Reiniciar o computador"
$shortcut.Save()

Write-Host "Atalho criado em: $shortcutPath"


# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
