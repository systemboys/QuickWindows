<#
QuickWindows.ps1 - Executa o menu com várias linhas de comandos
para instalação de softwares para Windows

URL: https://github.com/systemboys/QuickWindows.git
Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"

---------------------------------------------------------------
Este programa tem a finalidade de agilizar na instalação de softwares
para Windows durante a formatação e/ou manutenção de computadores.
---------------------------------------------------------------
Histórico:
v0.0.1 2023-10-28 às 16h40, Marcos Aurélio:
  - Versão inicial, menu de instalações de programas para Windows.
v0.0.2 2023-10-31 às 01h20, Marcos Aurélio:
  - Correções de alguns bugs e algumas alterações na documentação "README.md".
v0.0.3 2023-10-31 às 01h55, Marcos Aurélio:
  - Exibição da versão do QuickWindows no terminal.
v0.0.4 2023-10-31 às 02h40, Marcos Aurélio:
  - Adicionada a "Sessão Windows" e algumas opções.
v0.0.5 2023-10-31 às 11h10, Marcos Aurélio:
  - Funcionalidade das opções que Atualiza, Deleta e Recarrega o QuickWindows na Sessão "Menu QuickWindows".
  - Versão inicial, menu_Session_2 de instalações de programas para Windows.
v0.0.6 2023-10-31 às 22h40, Marcos Aurélio:
  - Código PowerShell para atualizar softwares do Windows usando o comando winget.
v0.0.7 2023-10-31 às 23h55, Marcos Aurélio:
  - Script para instalar o Winget via Powershell.
v0.0.8 2023-10-31 às 01h10, Marcos Aurélio:
  - Sessão Internet, Instalação de AnyDesk.
v0.0.9 2023-11-01 às 07h40, Marcos Aurélio:
  - Versão inicial, Sessão de Redes para opções relacionadas à redes.
v0.1.0 2023-11-01 às 07h40, Marcos Aurélio:
  - Criada a opção para obter IP público na Sessão de Redes.
v0.1.1 2023-11-01 às 07h40, Marcos Aurélio:
  - Criada a opção para obter IP local na Sessão de Redes.
v0.1.2 2023-11-01 às 16h05, Marcos Aurélio:
  - Criada a opção para obter a rota de IP até a Google.com.
v0.1.3 2023-11-01 às 16h54, Marcos Aurélio:
  - Correção da verificação da existência do AnyDesk no Windows na opção Internet
    da sessão Internet.
v0.1.4 2023-11-01 às 22h50, Marcos Aurélio:
  - Execução Interativa de Comandos no PowerShell
v0.1.5 2023-11-01 às 23h45, Marcos Aurélio:
  - Script PowerShell que ao informar um domínio de um site, ele
    retornará com a rota da conexão na sessão QuickWindows / Redes.
v0.1.6 2023-11-01 às 22h55, Marcos Aurélio:
  - Correção na linha de comando que apaga o arquivo de instalação
    do AnyDesk baixado.
v0.1.7 2023-11-11 às 19h10, Marcos Aurélio:
  - Versão inicial, atualizar o "PowerShell" na sessão "Windows".
v0.1.8 2023-11-11 às 23h36, Marcos Aurélio:
  - Opção para instalar o "Microsoft Edge" na sessão "Internet".
v0.1.9 2023-11-11 às 23h50, Marcos Aurélio:
  - Opção para Instalação o "Google Chrome" na sessão "Internet".
v0.2.0 2023-11-12 às 11h00, Marcos Aurélio:
  - Correção, foi reescrito o script para baixar e executar o instalador
    do "Microsoft Edge" na sessão "Internet".
v0.2.1 2023-11-12 às 15h20, Marcos Aurélio:
  - Opção para instalar o "Google Earth Pro" na sessão "Internet".
v0.2.2 2023-11-13 às 18h10, Marcos Aurélio:
  - Renomeadas as extensões dos "arquivos.bat" para "arquivos.cmd".
v0.2.3 2023-11-13 às 21h10, Marcos Aurélio:
  - Opção para Instalar o "Skype" na sessão "Internet".
v0.2.4 2023-11-13 às 22h15, Marcos Aurélio:
  - Opção para instalar o navetador "Opera" na sessão "Internet".
v0.2.5 2023-11-13 às 22h50, Marcos Aurélio:
  - Opção para instalar o navetador "Mozilla Firefox" na sessão "Internet".
v0.2.6 2023-11-13 às 23h40, Marcos Aurélio:
  - Opção para instalar o visualizador "Real VNC Viewer" na sessão "Internet".
v0.2.7 2023-11-14 às 00h15, Marcos Aurélio:
  - Opção para Menu de sessão a acesso rápido a algumas funcionalidades do Windows na sessão "Windows".
v0.2.8 2023-11-14 às 18h02, Marcos Aurélio:
  - Foi criado um novo arquivo "QuickWindows.ps1" para substituir o arquivo "QuickWindows.cmd", agora todo
    o script será em PowerShell. O layout do menu foi mudado radicalmente.

Licença: GPL.
#>

# Get the name of the current script file
$currentFileName = $MyInvocation.MyCommand.Name

# Adjusting PowerShell window dimensions
$width = "120"
$height = "30"
$size = New-Object System.Management.Automation.Host.Size($width, $height)
$host.UI.RawUI.WindowSize = $size

# Colors
$Host.UI.RawUI.BackgroundColor = "Black" # Background
$Host.UI.RawUI.ForegroundColor = "Green" # Font

# Optoin Functions
. .\optionFunctions.ps1

# Globla Variables
. .\globalVariables.ps1

# Option Menu
. .\menuOptions.ps1

# Region FUNCTIONS

# Function used to simply revert console colors
function Reverse-Colors {
    $bColor = [System.Console]::BackgroundColor
    $fColor = [System.Console]::ForegroundColor
    [System.Console]::BackgroundColor = $fColor
    [System.Console]::ForegroundColor = $bColor    
}

# Main function showing the menu
function New-Menu {
    param(
        [parameter(Mandatory=$true)][System.Collections.Generic.List[string]]$menuItems, # Contains all menu items
        [string]$title       = $title,                                                   # The title for the menu
        [string]$hint        = $hint,                                                    # Hint to be displayed above menu entries
        [string]$footer      = $footer,                                                  # Menu footer
        [ValidateSet("green","yellow","red","black","white")]                            # You might add more colors allowed by console
        [string]$titleColor  = 'Yellow'                                                  # Color of the title
    )
    
    # Prepare variables with function wide scope
    $invalidChoice = $false                     # Initialize the flag indicating whether an ivalid key was pressed
    $selectIndex   = 0                          # Initialize the variable storing the selection index (by default the first entry)
    $outChar       = 'a'                        # Initialize the variable storing the Enter or Esc value

    # Prepare the cosnole
    [System.Console]::CursorVisible = $false    # Hide the cursor, we don't need it
    [Console]::Clear()                          # Clear everything before showing the menu

    # Main loop showing all the entries and handling the interaction with user
    # End the loop only when Enter or Escape is pressed
    while (([System.Int16]$inputChar.Key -ne [System.ConsoleKey]::Enter) -and ([System.Int16]$inputChar.Key -ne [System.ConsoleKey]::Escape)) {
        
        # Show title and hint
        [System.Console]::CursorTop = 0                     # Start from top and then overwrite all lines; it's used instead of Clear to avoid blinking
        $tempColor = [System.Console]::ForegroundColor      # Keep the default font color 
        [System.Console]::ForegroundColor = $titleColor     # Set the color for title according to value of parameter
        [System.Console]::WriteLine("$title`n")             # The title for the menu
        [System.Console]::ForegroundColor = $tempColor      # Revert back to default font color
        
        [System.Console]::WriteLine($hint)
        [System.Console]::WriteLine($header)
        # Show all entries
        for ($i = 0; $i -lt $menuItems.Count; $i++) {
            [System.Console]::Write("$leftSideEdge ► [$i] ")                    # Add identity number to each entry, it's not highlighted for selection but it's in the same line
            if ($selectIndex -eq $i) {
                Reverse-Colors                                      # In case this is the selected entry, reverse color just for it to make the selection visible
                [System.Console]::WriteLine($menuItems[$i] + "◄ $rightSideEdge")
                Reverse-Colors      
            } else {
                [System.Console]::WriteLine($menuItems[$i] + "◄ $rightSideEdge") # In case this is not-selected entry, just show it
            }
        }
        [System.Console]::WriteLine($footer)

        # In case of invalid key, show the message
        if ($invalidChoice) {
            [System.Console]::WriteLine("Invalid button! Try again...")
        } else {
            [System.Console]::Write([System.String]::new(' ',[System.Console]::WindowWidth)) # In case the valid key was used after invalid, clean-up this line
            [System.Console]::SetCursorPosition(0,[System.Console]::CursorTop)               # Set the cursor back to first column so it's properly back to 1st column, 1st row in next iteration of the loop
        }
        $invalidChoice = $false                                                              # Reset the invalid key flag

        # Read the key from user
        $inputChar=[System.Console]::ReadKey($true)

        # Try to convert it to number
        try {
            $number = [System.Int32]::Parse($inputChar.KeyChar)
        }
        catch{
            $number = -1                                                                     # In case it's not a valid number, set to always invalid -1
        }
        
        # Hanlde arrows
        if ([System.Int16]$inputChar.Key -eq [System.ConsoleKey]::DownArrow) {
            if ($selectIndex -lt $menuItems.Count -1) {                                       # Avoid selection out of range
                $selectIndex++
            }
        } elseif ([System.Int16]$inputChar.Key -eq [System.ConsoleKey]::UpArrow) {
            if ($selectIndex -gt 0) {                                                         # Avoid selection out of range
                $selectIndex--
            }
        } elseif ($number -ge 0 -and $number -lt $menuItems.Count) {                          # If it's valid number within the range
            # Handle double-digit numbers
            $timestamp = Get-Date       
            while (![System.Console]::KeyAvailable -and ((get-date) - $timestamp).TotalMilliseconds -lt 500) {
                Start-Sleep -Milliseconds 250                                               # Give the user 500 miliseconds to type in the 2nd digit, check after 250 to improve responsivness
            }
            if ([System.Console]::KeyAvailable) {                                            # If user typed a key, read it in next line
                $secondChar = [System.Console]::ReadKey($true).KeyChar
                $fullChar   = "$($inputChar.KeyChar)$($secondChar)"                         # Join both keys
                try {
                    # Set selection
                    $number = [System.Int32]::Parse($fullChar)                              # Set the selection accordingly or raise flag for invalid key
                    if ($number -ge 0 -and $number -lt $menuItems.Count) {
                        $selectIndex   = $number
                    } else {
                        $invalidChoice = $true
                    }                
                }
                catch {
                    $invalidChoice = $true
                }
            } else {
                # Set selection
                $selectIndex = $number                                                       # Set selection for single digit number
            }
        } else {
            $invalidChoice = $true                                                           # Key not recognized, raise the flag
        }
        $outChar = $inputChar                                                                # Assign the key value to variable with scope outside the loop
    }

    # Hanlde the result, just show the selected entry if Enter was pressed; do nothing if Escape was pressed
    if ($outChar.Key -eq [System.ConsoleKey]::Enter) {
        [Console]::WriteLine(" You selected $($menuItems[$selectIndex])")
        Invoke-Command -ScriptBlock (Get-Command "menuOption_$selectIndex").ScriptBlock
    }
}

# Endregion FUNCTIONS

# Region MAIN SCRIPT

# Show the menu
do {
    New-Menu $menuItems
} while ($outChar.Key -ne [System.ConsoleKey]::Escape)

#endregion MAIN SCRIPT

