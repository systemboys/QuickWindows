# Functions of choices after Enter
function commandExecution_0() {
    clear
    exit
}
function commandExecution_1() {
    Write-Host "Running commands for $selection"
    # Start of commands here...

    # $scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "Package_Installers\Menu_QuickWindows\Menu_QuickWindows.ps1"
    # Invoke-Command -ScriptBlock { & $using:scriptPath }

    Invoke-Command -ScriptBlock { & "Package_Installers\Menu_QuickWindows\Menu_QuickWindows.ps1" }

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

