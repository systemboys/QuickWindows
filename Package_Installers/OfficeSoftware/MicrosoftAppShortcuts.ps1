# MicrosoftAppShortcuts.ps1 - Executa o script de criação de atalhos para os aplicativos OMicrosoft Office.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na criação de atalhos para os aplicativos OMicrosoft Office.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-04-17 às 20h10, Marcos Aurélio:
#   - Versão inicial, Criação dos atalhos dos aplicativos Microsoft Office na área de trabalho do Windows.
# v1.0.1 2024-06-14 às 23h03, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 23h02, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.1 2024-07-28 às 00h41, Marcos Aurélio:
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
# Importar a função
. ..\..\functions.ps1

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

# ----------------------[Conteúdo do script abaixo]---------------------------

# Caminhos dos aplicativos do Office
$officeApps = @{
    "Excel" = "${env:ProgramFiles}\Microsoft Office\root\Office16\EXCEL.EXE";
    "PowerPoint" = "${env:ProgramFiles}\Microsoft Office\root\Office16\POWERPNT.EXE";
    "Visio" = "${env:ProgramFiles}\Microsoft Office\root\Office16\VISIO.EXE";
    "Word" = "${env:ProgramFiles}\Microsoft Office\root\Office16\WINWORD.EXE";
    "Outlook" = "${env:ProgramFiles}\Microsoft Office\root\Office16\OUTLOOK.EXE";
    "OneNote" = "${env:ProgramFiles}\Microsoft Office\root\Office16\ONENOTE.EXE";
}

# Caminho do Desktop
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory)

# Verifica se o Office está instalado
if (Test-Path "${env:ProgramFiles}\Microsoft Office\root\Office16") {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O Microsoft Office está instalado."; Write-Host "Log created in: $logPath"; clear
    Write-Host "Microsoft Office is installed."

    # Cria atalhos para cada aplicativo do Office
    foreach ($app in $officeApps.GetEnumerator()) {
        # Verifica se o arquivo de execução do programa existe
        if (Test-Path $app.Value) {
            # Nome do atalho
            $shortcutName = $app.Name

            # Caminho completo para o atalho
            $shortcutPath = Join-Path -Path $desktopPath -ChildPath "$shortcutName.lnk"

            # Criar um objeto WScript.Shell
            $shell = New-Object -ComObject WScript.Shell

            # Criar atalho
            $shortcut = $shell.CreateShortcut($shortcutPath)
            $shortcut.TargetPath = $app.Value
            $shortcut.Description = "Microsoft $($app.Name)"
            $shortcut.Save()

            $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Atalho para $shortcutName criado com sucesso na área de trabalho."; Write-Host "Log created in: $logPath"; clear
            Write-Host "Shortcut for $shortcutName successfully created on the desktop."
        } else {
            $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O executável para $shortcutName não existe. Ignorando..."; Write-Host "Log created in: $logPath"; clear
            Write-Host "Executable for $shortcutName does not exist. Skipping..."
        }
    }
} else {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O Microsoft Office não está instalado."; Write-Host "Log created in: $logPath"; clear
    Write-Host "Microsoft Office is not installed."
}

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
