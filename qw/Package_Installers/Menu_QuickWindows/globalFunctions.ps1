# globalFunctions.ps1 - Executa o menu com várias linhas de comandos
# para instalação de softwares para Windows
#
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

# Functions of choices after Enter
function commandExecution_0() {
    clear
    exit
}
function commandExecution_1() {
    Write-Host "Running commands for $selection"
    # Start of commands here...
    $scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "file\path\file.ps1"
    Start-Process -FilePath "PowerShell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    # End of commands here...
    Read-Host -Prompt "Commands executed successfully, press Enter to return!"
    $defaultSelection = 1
    & .\QuickWindows.ps1 $defaultSelection
}
function commandExecution_2() {
    Write-Host "Running commands for $selection"
    # Start of commands here...
    # Command 1...
    # Command 2...
    # Command 3...
    # End of commands here...
    Read-Host -Prompt "Commands executed successfully, press Enter to return!"
    $defaultSelection = 2
    & .\QuickWindows.ps1 $defaultSelection
}
function commandExecution_3() {
    Write-Host "Running commands for $selection"
    # Start of commands here...
    # Command 1...
    # Command 2...
    # Command 3...
    # End of commands here...
    Read-Host -Prompt "Commands executed successfully, press Enter to return!"
    $defaultSelection = 3
    & .\QuickWindows.ps1 $defaultSelection
}

