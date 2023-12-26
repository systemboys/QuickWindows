# AdjustTimeForBrasilia.ps1 - Executa o script que ajusta o horário para Brasília.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de executar o script que ajusta o horário para Brasília.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-12-26 às 00h43, Marcos Aurélio:
#   - Versão inicial, Ajustando horário para Brasília.
#
# Licença: GPL.

# # Define o fuso horário desejado
# $timezoneId = "E. South America Standard Time"

# # Define o comando para ajustar o fuso horário do sistema
# $command = "tzutil /s '$timezoneId'"

# # Executa o comando para ajustar o fuso horário
# Invoke-Expression -Command $command

# ------------------
# Obter a data e hora atual na internet no fuso horário Brasileiro (Brasília)
$currentTime = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
Set-Date -Date $currentTime
# ------------------

Write-Host "Time zone for Brasilia successfully set!"
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
