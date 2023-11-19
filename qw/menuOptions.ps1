<#
menuOptions.ps1 - Exporta as variáveis para outros arquivos.

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

# Populate menuItems with example entries
$menuItems = [System.Collections.Generic.List[string]]::new()
$menuItems.Add(" ..\Sair                                                    ")
$menuItems.Add("Opção 1                                                     ")
$menuItems.Add("Opção 2                                                     ")
$menuItems.Add("Opção 3                                                     ")

