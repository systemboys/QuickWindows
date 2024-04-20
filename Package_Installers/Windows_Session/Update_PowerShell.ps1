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
# v0.0.2 2024-03-08 às 12h10, Marcos Aurélio:
#   - Condição com uma chave para escolher qual dos comandos serão executados.
#
# Licença: GPL.

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size(100, 30)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Script para atualizar o PowerShell para a versão mais recente

# Verificar se o usuário possui privilégios de administrador
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Este script precisa ser executado com privilégios de administrador."
    exit
}

$chave = 2 # "1" para o comando "Invoke-WebRequest", "2" para a ferramenta "IRM".

if ($chave -eq 1) {
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
} elseif ($chave -eq 2) {
    iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

