<#
globalVariables.ps1 - Exporta as variáveis para outros arquivos.

Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"

---------------------------------------------------------------
Este programa tem a finalidade de exportar variáveis para outros arquivos.
---------------------------------------------------------------
Histórico:
v0.0.1 2023-11-19 às 23h01, Marcos Aurélio:
  - Versão inicial, variáveis globais.

Licença: GPL.
#>

# Definition of variables
$currentYear = Get-Date -Format yyyy
$timeOnMarket = ($currentYear - 2008)

# Display
$title  = " QuickWindows v0.2.8"
$hint   = " (i) Use as setas ↓ e ↑ ou números, Enter ◄┘ Executa e ESC sai!`n"
$header = "                     ┌───────────────────────────┐
 ┌───────────────────┤░▒▓ QuackWindows | Home ▓▒░├───────────────────┐
┌┴───────────────────┘                           └───────────────────┴┐"
$leftSideEdge = "│"
# The menu options are posted here from the "menuOptions".ps1 file
$rightSideEdge = "│"
$footer = "└┬─────────────────────────────────────────────────────────────┬─┬─┬─┬┘
 │ (C) $currentYear GLOBAL TEC Informática (R) - GTi                     - ┼ ┤
 │ A $timeOnMarket anos no mercado de informática.                            - ┤
 │ A Tecnologia da Informção é o Futuro.                             ┤
 │ Website: https://gti1.com.br | Email: systemboys@hotmail.com    - ┤
 │ Author: Marcos Aurélio - Engenheiro de Software               - ┼ ┤
 └─────────────────────────────────────────────────────────────┴─┴─┴─┘"