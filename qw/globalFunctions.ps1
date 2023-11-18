<# Title: PowerShell Menu QuickWindows | Author: Marcos Aurélio | Date: November 14, 2023 | Website: https://gti1.com.br/ #>

# globalFunctions.ps1 - Executa o menu com várias linhas de comandos
# para instalação de softwares para Windows
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de executar comandos diversos.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-14 às 18h02, Marcos Aurélio:
#   - Versão inicial, função que executa as ações das opções selecionadas no menu.
#
# Licença: GPL.

# Option display: 0. Sair...
function commandExecution_0() {
    clear
    exit
}

# Option display: 1. Menu QuickWindows
function commandExecution_1() {
    Write-Host "Running commands for $selection"
    # Start of commands here...
    & .\Package_Installers\Menu_QuickWindows\Menu_QuickWindows.ps1
    # End of commands here...
    Read-Host -Prompt "Commands executed successfully, press Enter to return!"
    $defaultSelection = 1
    & .\QuickWindows.ps1 $defaultSelection
}

# Option display: 2. Windows
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

# Option display: 3. Interneet
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

# Option display: 4. Redes
function commandExecution_4() {
    Write-Host "Running commands for $selection"
    # Start of commands here...
    # Command 1...
    # Command 2...
    # Command 3...
    # End of commands here...
    Read-Host -Prompt "Commands executed successfully, press Enter to return!"
    $defaultSelection = 4
    & .\QuickWindows.ps1 $defaultSelection
}

# Option display: 5. Execução de Comandos no PowerShell
function commandExecution_5() {
    Write-Host "Running commands for $selection"
    # Start of commands here...
    # Command 1...
    # Command 2...
    # Command 3...
    # End of commands here...
    Read-Host -Prompt "Commands executed successfully, press Enter to return!"
    $defaultSelection = 5
    & .\QuickWindows.ps1 $defaultSelection
}

