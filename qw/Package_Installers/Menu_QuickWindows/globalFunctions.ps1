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
#   - Versão inicial, função que executa as ações das opções selecionadas no menu.
#
# Licença: GPL.

# Option display: 0. Sair...
function commandExecution_0() {
    clear
    exit
}

# Option display: 1. Opção 1
function commandExecution_1() {
    Write-Host "Running commands for $selection"
    # Start of commands here...
    # Command 1...
    # Command 2...
    # Command 3...
    # End of commands here...
    Read-Host -Prompt "Commands executed successfully, press Enter to return!"
    $defaultSelection = 1
    & .\Menu_QuickWindows.ps1 $defaultSelection
}

# Option display: 2. Opção 2
function commandExecution_2() {
    Write-Host "Running commands for $selection"
    # Start of commands here...
    # Command 1...
    # Command 2...
    # Command 3...
    # End of commands here...
    Read-Host -Prompt "Commands executed successfully, press Enter to return!"
    $defaultSelection = 2
    & .\Menu_QuickWindows.ps1 $defaultSelection
}

# Option display: 3. Opção 3
function commandExecution_3() {
    Write-Host "Running commands for $selection"
    # Start of commands here...
    # Command 1...
    # Command 2...
    # Command 3...
    # End of commands here...
    Read-Host -Prompt "Commands executed successfully, press Enter to return!"
    $defaultSelection = 3
    & .\Menu_QuickWindows.ps1 $defaultSelection
}

