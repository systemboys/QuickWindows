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

# Script para atualizar o PowerShell para a versão mais recente

# Verificar se o usuário possui privilégios de administrador
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Este script precisa ser executado com privilégios de administrador."
    exit
}

# URL do instalador do PowerShell Core
$installerUrl = "https://aka.ms/install-powershell.ps1"

# Caminho para o instalador temporário
$installerPath = Join-Path $env:TEMP "install-powershell.ps1"

# Baixar o script de instalação
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Executar o script de instalação
& $installerPath

# Remover o script de instalação temporário
Remove-Item $installerPath -Force

# /Script para atualizar o PowerShell para a versão mais recente

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

