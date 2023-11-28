<#
Menu_QuickWindows.ps1 - Executa o menu com opções personalizadas.

URL: https://github.com/systemboys/QuickWindows.git
Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"

---------------------------------------------------------------
Este programa tem a finalidade de disponibilizar opções personalizadas
para serem selecionadas com uso de setas direcionais.
---------------------------------------------------------------
Histórico:
v0.0.1 2023-11-19 às 23h01, Marcos Aurélio:
  - Versão inicial, começo do script...

Licença: GPL.
#>

# Adjusting PowerShell window dimensions
$width = "120"
$height = "30"
$size = New-Object System.Management.Automation.Host.Size($width, $height)
$host.UI.RawUI.WindowSize = $size

# Definition of variables
$currentYear = Get-Date -Format yyyy
$timeOnMarket = ($currentYear - 2008)

# Colors
$Host.UI.RawUI.BackgroundColor = "Black" # Background
$Host.UI.RawUI.ForegroundColor = "Green" # Font

# Menu Option 0
function menuOption_0() {
    clear
    cd .. ; cd ..
    & .\QuickWindows.ps1
}

# Menu Option 1
function menuOption_1() {
    Write-Host " Function 1 executed successfully..."

    # Start your commands here
    # Command 1...
    # Command 2...
    # Command 3...
    # End your commands here

    # Press a key to continue...
    Write-Host " Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Menu Option 2
function menuOption_2() {
    Write-Host " Function 2 executed successfully..."

    # Start your commands here
    # Command 1...
    # Command 2...
    # Command 3...
    # End your commands here

    # Press a key to continue...
    Write-Host " Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Menu Option 3
function menuOption_3() {
    Write-Host " Function 3 executed successfully..."

    # Start your commands here
    # Command 1...
    # Command 2...
    # Command 3...
    # End your commands here

    # Press a key to continue...
    Write-Host " Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

$menutitle = "                     ┌───────────────────────────┐                      
 ┌───────────────────┤░▒▓ QuackWindows | Menu ▓▒░├────────────────────┐ 
┌┴───────────────────┘                           └────────────────────┴┐"
$menuprompt = "└┬──────────────────────────────────────────────────────────────┬─┬─┬─┬┘
 │ (C) $currentYear GLOBAL TEC Informática (R) - GTi                      - ┼ ┤ 
 │ A $timeOnMarket anos no mercado de informática.                             - ┤ 
 │ A Tecnologia da Informção é o Futuro.                              ┤ 
 │ Website: https://gti1.com.br | Email: systemboys@hotmail.com     - ┤ 
 │ Author: Marcos Aurélio - Engenheiro de Software                - ┼ ┤ 
 └──────────────────────────────────────────────────────────────┴─┴─┴─┘ "
$backgroundHeader = "DarkGreen"
$backgroundFooter = "DarkGreen"
$backgroundMenu = "DarkMagenta"
$backgroundSelect = "DarkGreen"
$fontColor = "Green"
$fontColorSelect = "Green"

# Definição das opções do menu
$menu = @(
    "..\Voltar                                                          ",
    "Option 1                                                           ",
    "Option 2                                                           "
    "Option 3                                                           "
)

$default = 0

function Show-Menu {
    Clear-Host
    Write-Host $menutitle -BackgroundColor $backgroundHeader -ForegroundColor $fontColor

    for ($i = 0; $i -lt $menu.Count; $i++) {
        if ($i -eq $selection) {
            Write-Host ("│" + $i + ": " + $menu[$i] + "│") -BackgroundColor $backgroundSelect -ForegroundColor $fontColorSelect
        } else {
            Write-Host ("│" + $i + ": " + $menu[$i] + "│") -BackgroundColor $backgroundMenu -ForegroundColor $fontColor
        }
    }

    Write-Host $menuprompt -BackgroundColor $backgroundFooter -ForegroundColor $fontColor
}

$selection = $default

while ($true) {
    Show-Menu

    $key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown').VirtualKeyCode

    switch ($key) {
        38 { if ($selection -gt 0) { $selection-- } } # up arrow
        40 { if ($selection -lt ($menu.Count - 1)) { $selection++ } } # down arrow
        13 { # Enter key
            Invoke-Command -ScriptBlock (Get-Command "menuOption_$selection").ScriptBlock
        }
    }
}

#endregion MAIN SCRIPT