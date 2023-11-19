# Definition of variables
$currentYear = Get-Date -Format yyyy
$timeOnMarket = ($currentYear - 2008)

# Display
$title  = " QuickWindows v0.2.8"
$hint   = " (i) Use as setas ↓ e ↑ ou números, Enter ◄┘ Executa e ESC sai!`n"
$header = "                    ┌─────────────────────────────┐
 ┌──────────────────┤░▒▓ QuackWindows | Início ▓▒░├──────────────────┐
┌┴──────────────────┘                             └──────────────────┴┐"
$leftSideEdge = "│"

# Populate menuItems with example entries
$menuItems = [System.Collections.Generic.List[string]]::new()
$menuItems.Add(" ..\Sair                                                    ")
$menuItems.Add(" Opção 1                                                    ")
$menuItems.Add(" Opção 2                                                    ")
$menuItems.Add(" Opção 3                                                    ")

$rightSideEdge = "│"
$footer = "└┬───────────────────────────────────────────────────────────────────┬┘
 │ (C) $currentYear GLOBAL TEC Informática (R) - GTi                         │
 │ A $timeOnMarket anos no mercado de informática.                              │
 │ A Tecnologia da Informção é o Futuro.                             │
 │ Website: https://gti1.com.br | Email: systemboys@hotmail.com      │
 │ Author: Marcos Aurélio - Engenheiro de Software                   │
 └───────────────────────────────────────────────────────────────────┘"