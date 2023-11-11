# Update_PowerShell.ps1 - Executa o script que atualizar o PowerShell.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de atualizar o PowerShell.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-11 às 19h10, Marcos Aurélio:
#   - Versão inicial, atualizar o PowerShell.
#
# Licença: GPL.

# Script em PowerShell para atualizar o próprio PowerShell

# Verificar se o usuário possui privilégios de administrador
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Este script precisa ser executado com privilégios de administrador."
    exit
}

# Verificar se o PowerShell está sendo executado como administrador
if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Process -Id $PID).StartInfo.Verb -match 'RunAs') {
    Write-Host "Este script não pode ser executado com privilégios de administrador através do menu 'Executar como administrador'."
    exit
}

# Verificar se há uma nova versão do PowerShell disponível
$latestVersion = Invoke-RestMethod -Uri 'https://api.github.com/repos/PowerShell/PowerShell/releases/latest' | Select-Object -ExpandProperty tag_name
$currentVersion = $PSVersionTable.PSVersion.ToString()

if ($latestVersion -eq $currentVersion) {
    Write-Host "Você já possui a versão mais recente do PowerShell instalada."
    exit
}

# Baixar o instalador da nova versão do PowerShell
$installerUrl = "https://github.com/PowerShell/PowerShell/releases/download/$latestVersion/PowerShell-$latestVersion-win-x64.msi"
$installerPath = "$env:TEMP\PowerShell-$latestVersion.msi"

Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instalar a nova versão do PowerShell
Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$installerPath`" /quiet" -Wait

# Reiniciar o PowerShell para aplicar as alterações
Write-Host "O PowerShell será reiniciado para aplicar as alterações."
Start-Sleep -Seconds 3
Restart-Process -FilePath powershell.exe

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

