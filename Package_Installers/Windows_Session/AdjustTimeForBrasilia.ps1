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

# Define o fuso horário para Brasília
$timezone = [System.TimeZoneInfo]::FindSystemTimeZoneById("E. South America Standard Time")

# Obtém a data e hora atual
$currentTime = Get-Date

# Converte a data e hora atual para o fuso horário de Brasília
$adjustedTime = [System.TimeZoneInfo]::ConvertTime($currentTime, $timezone)

# Ajusta a data e hora do sistema para o fuso horário de Brasília
Set-Date $adjustedTime

Write-Host "Time zone for Brasilia successfully set!"
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
