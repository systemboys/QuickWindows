<#
menuOptions.ps1 - Exporta as variáveis para outros arquivos.

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

# Populate menuItems with example entries
$menuItems = [System.Collections.Generic.List[string]]::new()
$menuItems.Add("..\Exit                                                     ")
$menuItems.Add("Option 1                                                    ")
$menuItems.Add("Option 2                                                    ")
$menuItems.Add("Option 3                                                    ")