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
$menuItems.Add("..\Sair                                                     ")
$menuItems.Add("Menu QuickWindows                                           ")
$menuItems.Add("Windows                                                     ")
$menuItems.Add("Internet                                                    ")
$menuItems.Add("Redes                                                       ")
$menuItems.Add("Executar Comandos no PowerShell                             ")
$menuItems.Add("Utilitarios para Windows                                    ")

