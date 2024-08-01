# ShortcutMaker.ps1 - Executa o script de instalação de Shortcut Maker.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar a criação de atalhos no Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-10-31 às 01h10, Marcos Aurélio:
#   - Versão inicial, criar dois atalhos na Área de trabalho do Windows (Desligar e Reiniciar).
# v1.0.1 2024-06-14 às 23h15, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 22h39, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.1 2024-07-28 às 11h15, Marcos Aurélio:
#   - Registro de logs.
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

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

# ------Importação da função e configuração de endereço e arquivo para Registrar log------
# Tentativa de importar a função a partir de diferentes caminhos
# Primeiro caminho (subindo dois níveis)
$functionPath = "..\..\functions.ps1"

# Verifica se o arquivo existe no primeiro caminho
if (-not (Test-Path $functionPath)) {
    # Se não existir, tenta o caminho alternativo (nível zero)
    $functionPath = ".\functions.ps1"
}

# Importa a função do caminho encontrado
. $functionPath

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

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

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Atalho criado em: $shortcutPath para Desligar o computador"
Write-Host "Shortcut created at: $shortcutPath"

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

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Atalho criado em: $shortcutPath para Reiniciar o computador"
Write-Host "Shortcut created at: $shortcutPath"


# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
