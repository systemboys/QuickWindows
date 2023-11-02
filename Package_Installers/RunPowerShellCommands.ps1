# RunPowerShellCommands.ps1 - Execução Interativa de Comandos no PowerShell
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-01 às 22h50, Marcos Aurélio:
#   - Versão inicial, Execução Interativa de Comandos no PowerShell:
#     Como Permitir que os Usuários Execute Comandos Personalizados.
#
# Licença: GPL.

# Execução Interativa de Comandos no PowerShell

# Solicita ao usuário que digite um comando por meio do cmdlet
$command = Read-Host "Enter a command to be executed in PowerShell"
Invoke-Expression $command

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

