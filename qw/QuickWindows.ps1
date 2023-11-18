<# Title: PowerShell Menu QuickWindows | Author: Marcos Aurélio | Date: November 14, 2023 | Website: https://gti1.com.br/ #>

# QuickWindows.ps1 Executa o menu com várias linhas de comandos
# para instalação de softwares para Windows
#
# URL: https://github.com/systemboys/QuickWindows.git
# Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
# Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de agilizar na instalação de softwares
# para Windows durante a formatação e/ou manutenção de computadores.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-10-28 às 16h40, Marcos Aurélio:
#   - Versão inicial, menu de instalações de programas para Windows.
# v0.0.2 2023-10-31 às 01h20, Marcos Aurélio:
#   - Correções de alguns bugs e algumas alterações na documentação "README.md".
# v0.0.3 2023-10-31 às 01h55, Marcos Aurélio:
#   - Exibição da versão do QuickWindows no terminal.
# v0.0.4 2023-10-31 às 02h40, Marcos Aurélio:
#   - Adicionada a "Sessão Windows" e algumas opções.
# v0.0.5 2023-10-31 às 11h10, Marcos Aurélio:
#   - Funcionalidade das opções que Atualiza, Deleta e Recarrega o QuickWindows na Sessão "Menu QuickWindows".
#   - Versão inicial, menu_Session_2 de instalações de programas para Windows.
# v0.0.6 2023-10-31 às 22h40, Marcos Aurélio:
#   - Código PowerShell para atualizar softwares do Windows usando o comando winget.
# v0.0.7 2023-10-31 às 23h55, Marcos Aurélio:
#   - Script para instalar o Winget via Powershell.
# v0.0.8 2023-10-31 às 01h10, Marcos Aurélio:
#   - Sessão Internet, Instalação de AnyDesk.
# v0.0.9 2023-11-01 às 07h40, Marcos Aurélio:
#   - Versão inicial, Sessão de Redes para opções relacionadas à redes.
# v0.1.0 2023-11-01 às 07h40, Marcos Aurélio:
#   - Criada a opção para obter IP público na Sessão de Redes.
# v0.1.1 2023-11-01 às 07h40, Marcos Aurélio:
#   - Criada a opção para obter IP local na Sessão de Redes.
# v0.1.2 2023-11-01 às 16h05, Marcos Aurélio:
#   - Criada a opção para obter a rota de IP até a Google.com.
# v0.1.3 2023-11-01 às 16h54, Marcos Aurélio:
#   - Correção da verificação da existência do AnyDesk no Windows na opção Internet
#     da sessão Internet.
# v0.1.4 2023-11-01 às 22h50, Marcos Aurélio:
#   - Execução Interativa de Comandos no PowerShell
# v0.1.5 2023-11-01 às 23h45, Marcos Aurélio:
#   - Script PowerShell que ao informar um domínio de um site, ele
#     retornará com a rota da conexão na sessão QuickWindows / Redes.
# v0.1.6 2023-11-01 às 22h55, Marcos Aurélio:
#   - Correção na linha de comando que apaga o arquivo de instalação
#     do AnyDesk baixado.
# v0.1.7 2023-11-11 às 19h10, Marcos Aurélio:
#   - Versão inicial, atualizar o "PowerShell" na sessão "Windows".
# v0.1.8 2023-11-11 às 23h36, Marcos Aurélio:
#   - Opção para instalar o "Microsoft Edge" na sessão "Internet".
# v0.1.9 2023-11-11 às 23h50, Marcos Aurélio:
#   - Opção para Instalação o "Google Chrome" na sessão "Internet".
# v0.2.0 2023-11-12 às 11h00, Marcos Aurélio:
#   - Correção, foi reescrito o script para baixar e executar o instalador
#     do "Microsoft Edge" na sessão "Internet".
# v0.2.1 2023-11-12 às 15h20, Marcos Aurélio:
#   - Opção para instalar o "Google Earth Pro" na sessão "Internet".
# v0.2.2 2023-11-13 às 18h10, Marcos Aurélio:
#   - Renomeadas as extensões dos "arquivos.bat" para "arquivos.cmd".
# v0.2.3 2023-11-13 às 21h10, Marcos Aurélio:
#   - Opção para Instalar o "Skype" na sessão "Internet".
# v0.2.4 2023-11-13 às 22h15, Marcos Aurélio:
#   - Opção para instalar o navetador "Opera" na sessão "Internet".
# v0.2.5 2023-11-13 às 22h50, Marcos Aurélio:
#   - Opção para instalar o navetador "Mozilla Firefox" na sessão "Internet".
# v0.2.6 2023-11-13 às 23h40, Marcos Aurélio:
#   - Opção para instalar o visualizador "Real VNC Viewer" na sessão "Internet".
# v0.2.7 2023-11-14 às 00h15, Marcos Aurélio:
#   - Opção para Menu de sessão a acesso rápido a algumas funcionalidades do Windows na sessão "Windows".
# v0.2.8 2023-11-14 às 18h02, Marcos Aurélio:
#   - Foi criado um novo arquivo "QuickWindows.ps1" para substituir o arquivo "QuickWindows.cmd", agora todo
#     o script será em PowerShell. O layout do menu foi mudado radicalmente.
#
# Licença: GPL.

# Import global variables from the file
. .\inclusionFunctions.ps1

# My functions
. .\globalFunctions.ps1

# Adjusting PowerShell window dimensions
$width = "120"
$height = "30"
$size = New-Object System.Management.Automation.Host.Size($width, $height)
$host.UI.RawUI.WindowSize = $size

# Useful variables
$fileName = $MyInvocation.MyCommand.Name # This variable must be in this file
# If there is an argument, set the variable to the value of that argument
$defaultSelection = 0
if ($args) {
    $defaultSelection = $args[0]
}

# Colors
$Host.UI.RawUI.BackgroundColor = "Black" # Background
$Host.UI.RawUI.ForegroundColor = "Green" # Font
 
# Sample list data to populate menu:
# Set $List to any array to populate the menu with custom options
$List =
"Sair...                                                     ",
"Menu QuickWindows                                           ",
"Windows                                                     ",
"Internet                                                    ",
"Redes                                                       ",
"Execução de Comandos no PowerShell                          "

$List = for ($i = 0; $i -lt $List.Length; $i++) { "$($i). $($List[$i])" }

# menu offset to allow space to write a message above the menu
$xmin = 3
$ymin = 3

# Write Menu
Clear-Host
Write-Host "                    ┌─────────────────────────────┐"
Write-Host " ┌──────────────────┤░▒▓ QuackQindows | Início ▓▒░├──────────────────┐"
Write-Host "┌┴──────────────────┘                             └──────────────────┴┐"

# Menu Options
[Console]::SetCursorPosition(0, $ymin)
foreach ($name in $List) {
    for ($i = 0; $i -lt $xmin; $i++) {
        Write-Host -NoNewline
    }
    Write-Host "│ ►"$name" ◄ │"
}

# End of menu
Write-Host "└┬───────────────────────────────────────────────────────────────────┬┘"
Write-Host " │ Use as setas ↓ e ↑ para navegar e Enter ◄┘ para fazer uma seleção │"
Write-Host " └───────────────────────────────────────────────────────────────────┘"

# Footer
footerContent
 
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
$cursorY = $defaultSelection
Write-Highlighted
 
$selection = ""
$menu_active = $true
while ($menu_active) {
    if ([console]::KeyAvailable) {
        $x = $Host.UI.RawUI.ReadKey()
        [Console]::SetCursorPosition(1, $cursorY)
        Write-Normal
        switch ($x.VirtualKeyCode) { 
            # Down key
            38 {
                if ($cursorY -gt 0) {
                    $cursorY = $cursorY - 1
                }
            }
            # Up key
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
                $menu_active = $false
                & "commandExecution_$ID"
            }
        }
        Write-Highlighted
    }
}
