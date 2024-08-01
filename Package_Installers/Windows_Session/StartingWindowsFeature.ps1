# Download.ps1 - Executa o script de execução de recursos do Windows.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de recursos do Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-06-27 às 22h48, Marcos Aurélio:
#   - Versão inicial, executando recursos do Windows.
# v1.1.0 2024-07-28 às 11h20, Marcos Aurélio:
#   - Registro de logs.
#
# Licença: GPL.

# Recebe um argumento que pode ser um número
param (
    [Parameter(Mandatory=$true)]
    [int]$numero
)

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

# Importa a função do caminho encontrado
. $functionPath

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

# [1]  = Painel de Controle - Control
# [2]  = Editor de Registro - RegEdit
# [3]  = Configurações do Sistema - MSConfig
# [4]  = Serviços - Services.msc
# [5]  = Gerenciador de Dispositivos - DevMgmt.msc
# [6]  = Gerenciamento de Discos - DiskMgmt.msc
# [7]  = Explorador de arquivos do Windows
# [8]  = Configurações - Tela - tipo, ajustes de resolução de tela
# [9]  = Configurações avançadas do sistema - Propriedades do Sistema
# [10] = Editar Configurações do Plan
# [11] = Sobre o Windows - WinVer
# [12] = Configurações do Windows
# [13] = Gerenciador de Tarefas do Windows
# [14] = Opções de pastas - Control Folders

$terminalCommand1  = "start control"         # Painel de Controle - Control
$terminalCommand2  = "start regedit"         # Editor de Registro - RegEdit
$terminalCommand3  = "start msconfig"        # Configurações do Sistema - MSConfig
$terminalCommand4  = "start services.msc"    # Serviços - Services.msc
$terminalCommand5  = "start devmgmt.msc"     # Gerenciador de Dispositivos - DevMgmt.msc
$terminalCommand6  = "start diskmgmt.msc"    # Gerenciamento de Discos - DiskMgmt.msc
$terminalCommand7  = "start explorer"        # Explorador de arquivos do Windows
$terminalCommand8  = "start desk.cpl"        # Configurações - Tela - tipo, ajustes de resolução de tela
$terminalCommand9  = "start sysdm.cpl"       # Configurações avançadas do sistema - Propriedades do Sistema
$terminalCommand10 = "start powercfg.cpl"    # Editar Configurações do Plan
$terminalCommand11 = "start winver"          # Sobre o Windows - WinVer
$terminalCommand12 = "start ms-settings:"    # Configurações do Windows
$terminalCommand13 = "start taskmgr"         # Gerenciador de Tarefas do Windows
$terminalCommand14 = "start control folders" # Opções de pastas - Control Folders

# Verificação e comando a executar com base na escolha
switch ($numero) {
    1 { $commandToExecute  = $terminalCommand1 }  # Painel de Control - Control
    2 { $commandToExecute  = $terminalCommand2 }  # Editor de Registro - RegEdit
    3 { $commandToExecute  = $terminalCommand3 }  # Configurações do Sistema - MSConfig
    4 { $commandToExecute  = $terminalCommand4 }  # Serviços - Services.msc
    5 { $commandToExecute  = $terminalCommand5 }  # Gerenciador de Dispositivos - DevMgmt.msc
    6 { $commandToExecute  = $terminalCommand6 }  # Gerenciamento de Discos - DiskMgmt.msc
    7 { $commandToExecute  = $terminalCommand7 }  # Explorador de arquivos do Windows
    8 { $commandToExecute  = $terminalCommand8 }  # Configurações - Tela - tipo, ajustes de resolução de tela
    9 { $commandToExecute  = $terminalCommand9 }  # Configurações avançadas do sistema - Propriedades do Sistema
    10 { $commandToExecute = $terminalCommand10 } # Editar Configurações do Plan
    11 { $commandToExecute = $terminalCommand11 } # Sobre o Windows - WinVer
    12 { $commandToExecute = $terminalCommand12 } # Configurações do Windows
    13 { $commandToExecute = $terminalCommand13 } # Gerenciador de Tarefas do Windows
    14 { $commandToExecute = $terminalCommand14 } # Opções de pastas - Control Folders
    default {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Opção inválida. Por favor, escolha uma opção válida."
        Write-Host "Invalid option. Please choose a valid option."
        exit
    }
}

# Executar o comando selecionado.
Invoke-Expression -Command $commandToExecute

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
