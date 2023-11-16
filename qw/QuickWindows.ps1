<# Title: PowerShell Menu QuickWindows | Author: Marcos Aurélio | Date: November 14, 2023 | Website: https://gti1.com.br/ #>

#!/bin/bash

# QuickWindows.ps1 - Executa o menu com várias linhas de comandos
# para instalação de softwares para Windows
#
# URL: https://github.com/systemboys/QuickWindows.git
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de ...
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-14 às 18h02, Marcos Aurélio:
#   - Versão inicial, Menu Interativo para instalações de softwares e configurações do Windows.
#
# Licença: GPL.

# ------------------------------
# No arquivo QuickWindows.ps1
param($functionNumber)

# Importa as funções do arquivo Menu_QuickWindows.ps1
Import-Module ./globalFunctions.ps1

# Cria o nome da função baseado no número passado como argumento
$functionName = "function_" + $functionNumber

# Executa a função
& $functionName
# ------------------------------

# Adjusting PowerShell window dimensions
$width = "120"
$height = "30"
$size = New-Object System.Management.Automation.Host.Size($width, $height)
$host.UI.RawUI.WindowSize = $size

# Useful variables
Import-Module .\globalVariables.ps1
$fileName = $MyInvocation.MyCommand.Name # This variable must be in this file
$header = "text1"
$currentYear = Get-Date -Format yyyy
$timeOnMarket = ($currentYear - 2008)
$footer = " © $currentYear GLOBAL TEC Informática ® - GTi, $timeOnMarket anos no mercado de Informática
     Website: https://gti1.com.br | Email: systemboys@hotmail.com
            Author: Marcos Aurélio - Engenheiro de Software"

# Colors
$Host.UI.RawUI.BackgroundColor = "Black" # Background
$Host.UI.RawUI.ForegroundColor = "Green" # Font
 
# Sample list data to populate menu:
# Set $List to any array to populate the menu with custom options
$List =
"Sair...                                                     ",
"Opção 1                                                     ",
"Opção 2                                                     ",
"Opção 3                                                     "

$List = for ($i = 0; $i -lt $List.Length; $i++) { "$($i). $($List[$i])" }

# menu offset to allow space to write a message above the menu
$xmin = 3
$ymin = 3

# Write Menu
Clear-Host
Write-Host "                    ╓─────────────────────────────┐"
Write-Host " ╓──────────────────╢░▒▓ QuackQindows | Início ▓▒░├──────────────────┐"
Write-Host "╓╨──────────────────╜                             └──────────────────┴┐"
Write-Host

# Menu Options
[Console]::SetCursorPosition(0, $ymin)
foreach ($name in $List) {
    for ($i = 0; $i -lt $xmin; $i++) {
        Write-Host -NoNewline
    }
    Write-Host "║ ►"$name" ◄ │"
}

# End of menu
Write-Host "╚╦═══════════════════════════════════════════════════════════════════╤╛"
Write-Host " ║ Use as setas ↓ e ↑ para navegar e Enter ◄┘ para fazer uma seleção │"
Write-Host " ╚═══════════════════════════════════════════════════════════════════╛"

# Footer
Write-Host $footer
 
# Highlights the selected line
function Write-Highlighted {
 
    [Console]::SetCursorPosition(1 + $xmin, $cursorY + $ymin)
    Write-Host -BackgroundColor Yellow -ForegroundColor Black -NoNewline
    Write-Host $List[$cursorY] -BackgroundColor DarkGreen -ForegroundColor White
    [Console]::SetCursorPosition(0, $cursorY + $ymin)     
}

# Undoes highlight
function Write-Normal {
    [Console]::SetCursorPosition(1 + $xmin, $cursorY + $ymin)
    Write-Host $List[$cursorY]  
}
 
# highlight first item by default
$cursorY = 0
Write-Highlighted
 
$selection = ""
$menu_active = $true
while ($menu_active) {
    if ([console]::KeyAvailable) {
        $x = $Host.UI.RawUI.ReadKey()
        [Console]::SetCursorPosition(1, $cursorY)
        Write-Normal
        switch ($x.VirtualKeyCode) { 
            # Up key
            38 {
                if ($cursorY -gt 0) {
                    $cursorY = $cursorY - 1
                }
            }
             # Down key
            40 {
                if ($cursorY -lt $List.Length - 1) {
                    $cursorY = $cursorY + 1
                }
            }
            # Enter key
            13 {
                clear
                $selection = $List[$cursorY]
                $ID = $cursorY
                function function_0() {
                    cd ..
                    clear
                    exit
                }
                # ------------------------------
                .\QuickWindows.ps1 -functionNumber $ID
                # ------------------------------
                $menu_active = $false
            }
        }
        Write-Highlighted
    }
}
