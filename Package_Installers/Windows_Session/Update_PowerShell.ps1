# Update_PowerShell.ps1 - Executa o script que atualizar o PowerShell.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de atualizar o PowerShell.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-11-11 às 19h10, Marcos Aurélio:
#   - Versão inicial, atualizar o PowerShell.
# v1.1.0 2024-03-08 às 12h10, Marcos Aurélio:
#   - Condição com uma chave para escolher qual dos comandos serão executados.
# v1.1.1 2024-06-14 às 23h15, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.2.1 2024-06-16 às 22h38, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.3.1 2024-06-20 às 19h16, Marcos Aurélio:
#   - Incrementação de novo comando para atualização do PowerShell.
# v1.4.1 2024-07-28 às 11h22, Marcos Aurélio:
#   - Registro de logs.
#
# Licença: GPL.

# Configurações
# Tenta encontrar o arquivo config.json na pasta raiz
$configPath = "./config.json"
# Verifica se o arquivo existe no caminho atual
if (-not (Test-Path $configPath)) {
    # Se não existir, tenta o caminho relativo
    $configPath = "../../config.json"
}
# Importa as configurações do arquivo encontrado
$configData = Get-Content -Path $configPath | ConvertFrom-Json

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size($configData.PowerShellTerminalWidth, $configData.PowerShellTerminalHeight)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

# ------Importação da função e configuração de endereço e arquivo para Registrar log------
# Tentativa de importar a função a partir de diferentes caminhos
# Primeiro caminho (subindo dois níveis)
$functionPath = "..\..\functions.ps1"

# Verifica se o arquivo existe no primeiro caminho
if (-not (Test-Path $functionPath)) {
    # Se não existir, tenta o caminho alternativo (nível zero)
    $functionPath = ".\functions.ps1"
}

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

# Script para atualizar o PowerShell para a versão mais recente

# Verificar se o usuário possui privilégios de administrador
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Este script precisa ser executado com privilégios de administrador."
    exit
}

# Chave para definir qual comando será executado
# ----------------------------------------------
# "1" para o comando "Invoke-WebRequest"
# "2" para a ferramenta "IRM"
# "3" para a ferramenta "WinGet".
$chave = 3

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
} elseif ($chave -eq 3) {
    winget install --id Microsoft.Powershell --source winget
}
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Atualização do PowerShell."; Write-Host "Log created in: $logPath"; clear

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

