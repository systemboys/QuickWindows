<#
optionFunctions.ps1 - Exporta as variáveis para outros arquivos.

Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"

---------------------------------------------------------------
Este programa tem a finalidade de exportar variáveis para outros arquivos.
---------------------------------------------------------------
Histórico:
v0.0.1 2023-11-19 às 17h40, Marcos Aurélio:
  - Versão inicial, variáveis globais.

Licença: GPL.
#>

# Menu Option 0
function menuOption_0() {
    clear
    Write-Host "You have exited the menu..."
    exit
}

# Menu Option 1
function menuOption_1() {
    Write-Host " Function 1 executed successfully..."

    # Start your commands here
    cd Package_Installers
    cd Menu_QuickWindows
    & .\Menu_QuickWindows.ps1
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

