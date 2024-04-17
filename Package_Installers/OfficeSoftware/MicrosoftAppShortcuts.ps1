# MicrosoftAppShortcuts.ps1 - Executa o script de criação de atalhos para os aplicativos OMicrosoft Office.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na criação de atalhos para os aplicativos OMicrosoft Office.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-04-17 às 20h10, Marcos Aurélio:
#   - Versão inicial, Criação dos atalhos dos aplicativos Microsoft Office na área de trabalho do Windows.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

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

# Verifica se o Office está instalado
if (Test-Path "${env:ProgramFiles}\Microsoft Office\root\Office16") {
    Write-Host "Microsoft Office está instalado."

    # Cria atalhos para cada aplicativo do Office
    foreach ($app in $officeApps.GetEnumerator()) {
        $WshShell = New-Object -comObject WScript.Shell
        $Shortcut = $WshShell.CreateShortcut("$Home\Desktop\$($app.Name).lnk")
        $Shortcut.TargetPath = $app.Value
        $Shortcut.IconLocation = $app.Value
        $Shortcut.Description = "Microsoft $($app.Name)"
        $Shortcut.Save()
    }

    Write-Host "Atalhos criados com sucesso na área de trabalho."
} else {
    Write-Host "Microsoft Office não está instalado."
}

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
