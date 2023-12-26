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
$brasiliaTimeZone = [System.TimeZoneInfo]::FindSystemTimeZoneById("E. South America Standard Time")

# Obtém a data e hora atual no fuso horário de Brasília
$dateInBrasilia = [System.TimeZoneInfo]::ConvertTimeFromUtc([System.DateTime]::UtcNow, $brasiliaTimeZone)

# Define a data e hora do sistema para a data e hora de Brasília
Set-Date -Date $dateInBrasilia

Write-Host "Fuso horário para Brasília definido com sucesso!"
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
