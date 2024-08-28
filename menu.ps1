# menu.ps1 - Executa o script de instalação do QuickWindows.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o QuickWindows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-11-13 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação do QuickWindows.
# v1.0.1 2023-11-13 às 16h00, Marcos Aurélio:
#   - Correção feita na verificação onde fecha a janela do Windows PowerShell.
# v1.1.1 2023-12-04 às 15h06, Marcos Aurélio:
#   - Opção para instalar o "AnyDesk" quando o usuário chamar o menu interativo com a ferramenta IRM.
# v1.1.2 2023-12-07 às 00h24, Marcos Aurélio:
#   - Se o AnyDesk tiver instalado, o script pergunta se quer executá-lo e, reabertura do Windows PowerShell após instalação do Git.
# v1.1.3 2023-12-08 às 17h27, Marcos Aurélio:
#   - Alteração que faz com que o script não precise mais clonar novamente o "QuickWindows" caso já esteja instalado do diretório Temp.
# v1.1.4 2024-01-18 às 21h40, Marcos Aurélio:
#   - Alteração que verifica se o Windows PowerShell está sendo executado como administrador.
# v1.1.5 2024-03-09 às 16h26, Marcos Aurélio:
#   - Alteração que verifica se o arquivo 'QuickWindows.cmd' existe, se não existir, apagar o diretório 'QquicoWindows'.
# v1.1.6 2024-03-25 às 01h06, Marcos Aurélio:
#   - Modificação para criar um ícone da Área de trabalho do Windows que executar o script.
# v1.1.7 2024-03-26 às 14h31, Marcos Aurélio:
#   - Incrementação de uma descrição que deverá aparecer quando o ícone for apontado pelo mouse.
# v1.1.8 2024-03-29 às 00h05, Marcos Aurélio:
#   - Correção da ativação da execução de scripts no PowerShell.
# v1.2.8 2024-06-26 às 21h02, Marcos Aurélio:
#   - Instalação silenciosa do Git via Winget, se o Winget tiver instalado.
# v1.2.9 2024-07-03 às 00h36, Marcos Aurélio:
#   - Corrigido a remoção do instalador do Git no diretório Temp.
# v1.2.10 2024-07-05 às 19h07, Marcos Aurélio:
#   - Baixar o instalador via BitsTransfer e instalar o Git de forma silenciosa
# v1.2.11 2024-07-12 às 17h21, Marcos Aurélio:
#   - Melhorando a instalação do Git, eliminando o método com winget e deixando apenas o método de baixar e executar o instalador.
# v1.3.11 2024-07-12 às 23h06, Marcos Aurélio:
#   - Arquivo de log, versão inicial.
# v1.3.12 2024-07-24 às 21h48, Marcos Aurélio:
#   - Correção de um erro no final da instalação do Git, havia uma linha de comentário que não estava comentada "#".
# v1.3.13 2024-07-26 às 18h46, Marcos Aurélio:
#   - Função para simular a exibição de uma linha com o status 'OK'.
# v1.3.14 2024-07-26 às 21h37, Marcos Aurélio:
#   - Correção de um bug após instalação do Git, o PowerShell deve ser reinicializado.
# v1.3.15 2024-07-28 às 13h04, Marcos Aurélio:
#   - Definição de execução do software de acesso remoto, foi criada auma chave para para habilitar ou desabilitar o recurso.
# v1.4.15 2024-08-07 às 01h38, Marcos Aurélio:
#   - Download e execução de Moo0 System Monitor Portable.
# v1.4.16 2024-08-15 às 02h14, Marcos Aurélio:
#   - Verificar e finalizar o processo "SystemMonitor64" se estiver em execução.
# v1.4.17 2024-08-15 às 10h22, Marcos Aurélio:
#   - Ajustes no código, foi comentada a linha que exibe o tamanho do Git e alguns textos em português traduzidos para inglês.
# v1.4.18 2024-08-20 às 00h10, Marcos Aurélio:
#   - Resolvido a forma de como baixa e executar o script que era 'irm qw.gti1.com.br/menu.ps1 | iex' e agora é 'irm qw.gti1.com.br | iex'.
# v1.4.19 2024-08-28 às 02h28, Marcos Aurélio:
#   - Verificar se o arquivo 'Moo0_SystemMonitor_Portable.zip' existe, se existir, apagar.
#
# Licença: GPL.

clear

# Comando para usar no PowerShell
$PowerShellCommand = "irm qw.gti1.com.br | iex"

# Verifica se o Windows PowerShell está sendo executado como administrador
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script needs to be run as administrator."
    Start-Process powershell -Verb RunAs -ArgumentList "-Command $PowerShellCommand"
    exit
}

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Ativar a execução de scripts no PowerShell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

# Define o nome do diretório utilizado pelo QuickWindows
$dirName = "GTiSupport"

# Define o caminho completo do diretório utilizado pelo QuickWindows
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName

# Garantir que o diretório exista
if (-not (Test-Path -Path $fullPath)) {
    try {
        New-Item -Path $fullPath -ItemType Directory -Force
        Write-Host "Directory created successfully: $fullPath"
    } catch {
        Write-Host "An error occurred while creating the directory: $_"
        exit
    }
}

# ------------------------- Função que cria logs do sistema --------------------------
# Definindo o caminho do arquivo
$filePath = ".\functions.ps1"

# Verificando se o arquivo já existe
if (Test-Path $filePath) {
    Write-Host "The file already exists!"
    try {
        Import-Module $filePath -ErrorAction Stop
        Write-Host "File imported successfully."
    } catch {
        Write-Host "An error occurred while importing the file: $_"
    }
} else {
    # URL do arquivo para download
    $url = "https://raw.githubusercontent.com/systemboys/QuickWindows/main/functions.ps1"

    # Baixando o arquivo
    try {
        Invoke-WebRequest -Uri $url -OutFile $filePath
        Write-Host "File downloaded successfully."
        Import-Module $filePath -ErrorAction Stop
    } catch {
        Write-Host "An error occurred while downloading the file: $_"
    }
}
# ------------------------ /Função que cria logs do sistema ---------------------------

# Executar função que cria logs do sistema
$address = $fullPath
$fileName = "QWLog.txt"
$message = "QuickWindows iniciado, foi dado o comando para execução."
$logPath = QWLogFunction -Address $address -FileName $fileName -Message $message
Write-Host "Log created in: $logPath"
clear

# Se o AnyDesk não estiver instalado, faz o download e instalar
$programFiles = "$env:SystemDrive\Program Files (x86)"
$directory = "$programFiles\AnyDesk"

if (Test-Path $directory) {
    # Definição de execução do software de acesso remoto
    # 0 para desabilitar, 1 para habilitar
    $remoteInstallationRequest = 0
    if ($remoteInstallationRequest -eq 1) {
        # Carrega a biblioteca do .NET Framework para criar a pop-up
        [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null

        # Define a mensagem, o título e os botões da pop-up
        $message = "AnyDesk is already installed, do you want to run it?"
        $title = "AnyDesk"
        $buttons = [Microsoft.VisualBasic.MsgBoxStyle]::YesNo

        # Mostra a pop-up ao usuário e guarda a resposta em uma variável
        $response = [Microsoft.VisualBasic.Interaction]::MsgBox($message, $buttons, $title)

        # Verifica se a resposta do usuário foi "Sim"
        if ($response -eq "Yes") {
            # Executa o AnyDesk
            Start-Process -FilePath "$env:SystemDrive\Program Files (x86)\AnyDesk\AnyDesk.exe"
            # Executar função que cria logs do sistema
            $address = $fullPath
            $fileName = "QWLog.txt"
            $message = "O usuário confirmou a execução do AnyDesk."
            $logPath = QWLogFunction -Address $address -FileName $fileName -Message $message
            Write-Host "Log created in: $logPath"
            clear
        }
    }
} else {
    Add-Type -AssemblyName PresentationFramework

    $ButtonType = [System.Windows.MessageBoxButton]::YesNo
    $MessageIcon = [System.Windows.MessageBoxImage]::Question
    $MessageBody = "Do you want to install AnyDesk?"
    $MessageTitle = "AnyDesk Installation"
    $MessageBox = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)

    if ($MessageBox -eq 'Yes') {
        Write-Host "AnyDesk is not installed! Starting installation process."

        # Link do download e o diretório Temp
        $downloadUrl = "https://download.anydesk.com/AnyDesk.exe"
        $downloadPath = "$env:temp\AnyDesk.exe"
    
        # Faz o download do AnyDesk
        Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath
    
        # Instala o AnyDesk
        Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

        # Apagar o arquivo
        Remove-Item -Path $downloadPath -Force

        # Executar função que cria logs do sistema
        $address = $fullPath
        $fileName = "QWLog.txt"
        $message = "O usuário confirmou o download e a execução do AnyDesk."
        $logPath = QWLogFunction -Address $address -FileName $fileName -Message $message
        Write-Host "Log created in: $logPath"
        clear
    }
}

# ------------------ Ícone na Área de trabalho ---------------------------

# --- Criar diretório em ambiente de usuário ---
# Cria o diretório se ele não existir
if(!(Test-Path -Path $fullPath))
{
    New-Item -ItemType Directory -Path $fullPath
    Write-Host "'$dirName' directory successfully created in '$env:USERPROFILE'"
}
else
{
    Write-Host "'$dirName' directory already exists in '$env:USERPROFILE'"
}
# --- /Criar diretório em ambiente de usuário ---

# Comando a ser executado
$command = $PowerShellCommand

# Caminho do Desktop
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory)

# Nome do atalho
$shortcutName = "GTi Support"

# Caminho completo para o atalho
$shortcutPath = Join-Path -Path $desktopPath -ChildPath "$shortcutName.lnk"

# URL do ícone
$iconUrl = "https://github.com/systemboys/QuickWindows/raw/main/Images/QuickWindows.ico"

# Caminho local para salvar o ícone
$iconPath = "$env:USERPROFILE\GTiSupport\QuickWindows.ico"

# Baixar o ícone
Invoke-WebRequest -Uri $iconUrl -OutFile $iconPath

# Criar um objeto WScript.Shell
$shell = New-Object -ComObject WScript.Shell

# Criar atalho
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-Command `"$command`""
$shortcut.IconLocation = $iconPath
$shortcut.Description = "QuickWindows - Facilitate installations with routines"
$shortcut.Save()

Write-Host "Atalho criado em: $shortcutPath"
# ------------------ /Ícone na Área de trabalho ---------------------------

# -----------------Executar o Moo0 System Monitor--------------------------
# -----Verificar se o arquivo 'Moo0_SystemMonitor_Portable.zip' existe, se existir, apagar-----
# Define o caminho do arquivo
$filePath_Moo0 = "$env:temp\Moo0_SystemMonitor_Portable.zip"

# Verifica se o arquivo existe
if (Test-Path -Path $filePath_Moo0) {
    # Se existir, remove o arquivo
    Remove-Item -Path $filePath_Moo0 -Force
    Write-Output "File removed: $filePath_Moo0"
} else {
    # Se não existir, exibe uma mensagem informando
    Write-Output "File not found: $filePath_Moo0"
}
# ----/Verificar se o arquivo 'Moo0_SystemMonitor_Portable.zip' existe, se existir, apagar-----
# Verificar e finalizar o processo "SystemMonitor64" se estiver em execução
$processName = "SystemMonitor64"
$process = Get-Process -Name $processName -ErrorAction SilentlyContinue

if ($process) {
    Stop-Process -Name $processName -Force
    Write-Host "Process 'SystemMonitor64' terminated."
} else {
    Write-Host "Process 'SystemMonitor64' is not running."
}

$directoryPath = "$env:temp\Moo0_SystemMonitor_Portable\SystemMonitor64.exe"

if (Test-Path -Path $directoryPath) {
    # Executar o Moo0 System Monitor
    Start-Process -FilePath "$env:temp\Moo0_SystemMonitor_Portable\SystemMonitor64.exe"
} else {
    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/Moo0_SystemMonitor_Portable.zip"
    $downloadPath = "$env:temp\Moo0_SystemMonitor_Portable.zip"

    # Faz o download do Moo0 System Monitor
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = $configData.beepsOnDownloads
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }

    # Extrair o arquivo compactado (.zip)
    # Definir o caminho do diretório de destino para a extração
    $extractPath = $env:temp

    # Extrair o arquivo zip para o diretório de destino
    Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force

    # Definir o caminho do arquivo exe dentro do diretório descompactado
    $exePath = Join-Path -Path $extractPath -ChildPath "$extractPath\Moo0_SystemMonitor_Portable\SystemMonitor64.exe"
    # /Extrair o arquivo compactado (.zip)

    # Executar o Moo0 System Monitor
    Start-Process -FilePath "$extractPath\Moo0_SystemMonitor_Portable\SystemMonitor64.exe"
}
# ----------------/Executar o Moo0 System Monitor--------------------------

# Verifica se o Git está instalado no Windows (versões 10 e 11)
Write-Host "Checking if Git is installed on Windows..."

# Verificação do caminho padrão de instalação do Git em outras versões do Windows
$gitPaths = @(
    "$env:ProgramFiles\Git\bin\git.exe",
    "$env:ProgramFiles(x86)\Git\bin\git.exe"
)

$gitInstalled = $false

foreach ($path in $gitPaths) {
    if (Test-Path $path) {
        Write-Host "Git found at $path"
        $gitInstalled = $true
        break
    }
}

if ($gitInstalled) {
    Write-Host "Git is installed."
} else {
    Write-Host "Git is not installed."
    # -------------- Instalação do Git -------------------
    # Verifica se o Git já está instalado
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        # Definição do arquivo
        $fileName = "Git"
        $fileUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/VersionControlSoftware/Git_Setup.exe"
        $outputFileName = "Git_Setup.exe"
        $destinationPath = "$env:TEMP\$outputFileName"

        Write-Host "$fileName doesn't exist on Windows! Downloading the installer..."
        # Write-Host "File size: 58.4 MB"

        # Define os símbolos para o indicador de progresso
        $symbols = @('.   \', ' .  |', '  . /', '   .-')
        $index = 0

        # Função para mostrar o indicador de progresso
        function Show-Progress {
            param (
                [int]$delay = 100
            )
            while ($true) {
                foreach ($spin in $symbols) {
                    Write-Host -NoNewline "`r$spin"
                    Start-Sleep -Milliseconds $delay
                }
            }
        }

        # Inicia o download do instalador do Git em um job
        $job = Start-Job -ScriptBlock {
            param ($fileUrl, $destinationPath)
            Start-BitsTransfer -Source $fileUrl -Destination $destinationPath
        } -ArgumentList $fileUrl, $destinationPath

        # Loop para exibir o indicador de progresso enquanto o download está em andamento
        while ($job.State -eq 'Running') {
            Write-Host -NoNewline ("`rDownloading Git" + $symbols[$index])
            Start-Sleep -Milliseconds 200
            $index = ($index + 1) % $symbols.Count
        }

        # Espera o job terminar
        Wait-Job $job

        # Verifica o resultado do job
        $jobResult = Receive-Job $job
        if ($jobResult -eq $null) {
            Write-Host "`rDownload completed successfully!"
        } else {
            Write-Host "`rAn error occurred while downloading Git."
            $jobResult
        }

        # Remove o job
        Remove-Job $job

        Write-Host "`nRunning the $fileName installer..."

        # Instala o Git de forma silenciosa
        $process = Start-Process -FilePath $destinationPath -ArgumentList "/VERYSILENT" -NoNewWindow -PassThru

        # Função para aguardar o processo com indicador de progresso
        function Wait-ProcessWithProgress {
            param (
                [System.Diagnostics.Process]$process
            )
            while (-not $process.HasExited) {
                foreach ($spin in $symbols) {
                    Write-Host -NoNewline "`r$spin"
                    Start-Sleep -Milliseconds 100
                }
            }
        }

        # Espera o processo terminar enquanto mostra o indicador de progresso
        Wait-ProcessWithProgress -process $process

        Write-Host "`nDeleting the $fileName installer..."

        # Remove o instalador do Git
        if (Test-Path $destinationPath) {
            Remove-Item -Path $destinationPath -Force
        }

        # Executar função que cria logs do sistema
        $address = $fullPath
        $fileName = "QWLog.txt"
        $message = "O Git foi instalado com sucesso."
        $logPath = QWLogFunction -Address $address -FileName $fileName -Message $message
        Write-Host "Log created in: $logPath"
        clear

        Write-Host "`nDownload and installation completed."
    } else {
        Write-Host "Git is already installed."
    }
    # -------------- /Instalação do Git -------------------

    # Fechar a janela do Windows PowerShell
    Write-Host "After installing Git, Windows PowerShell must be restarted!"
    Write-Host "Type the same command again or press the up directional arrow key."
    Write-Host
    Write-Host "There is a GTi Support shortcut on the Desktop!"
    Write-Host
    # Write-Host "Press any key to continue..."
    # $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
# Fim da verificação do caminho padrão de instalação do Git em outras versões do Windows

# ------------------ Verifique se o QuickWindows existe -----------------------------
$programFiles = $env:TEMP
$filePath = "$programFiles\QuickWindows\QuickWindows.cmd"

if (Test-Path $filePath) {
    Write-Host "Starting QuickWindows..."
    Set-Location -Path "$env:TEMP\QuickWindows"
} else {
    # -------- Verificar se o arquivo "QuickWindows.cmd" existe, se não existir, apagar o diretório "QquicoWindows" ----------
    # Verifica se o QuickWindows existe e tenta removê-lo se não estiver em uso
    $programFiles = $env:TEMP
    $dirPath = "$programFiles\QuickWindows"

    if (Test-Path $dirPath) {
        Write-Host "Removing the $dirPath directory..."
        Remove-Item -Recurse -Force $dirPath -ErrorAction SilentlyContinue
    } else {
        Write-Host "The $dirPath directory does not exist."
    }

    # Verifica se o Git está disponível
    if (Get-Command git -ErrorAction SilentlyContinue) {
        # Clonar e executar Windows PowerShell novamente com o comando
        Write-Host "Cloning QuickWindows..."
        Set-Location -Path $env:TEMP
        git clone https://github.com/systemboys/QuickWindows.git
        Set-Location -Path .\QuickWindows\
    } else {
        Write-Host "PowerShell needs to be restarted. Press any key to continue and run the shortcut on the Desktop!"
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        exit
    }
}
# ------------------ /Verifique se o QuickWindows existe -----------------------------

# ------------------Simulação de carregamento de recursos-----------------------------
# Função para simular a inicialização do Linux
function Simulate-LinuxBoot {
    # Função para simular a exibição de uma linha com o status "OK"
    function Show-LoadingLine {
        param (
            [string]$message
        )
        Write-Host "[ " -NoNewline
        Write-Host "OK" -NoNewline -ForegroundColor Green
        Write-Host " ] $message"
        $sleepTime = Get-Random -InputObject @(100, 250, 500)
        Start-Sleep -Milliseconds $sleepTime
    }

    # Mensagens para exibir
    $messages = @(
        "Started LSB: Record successful boot for GRUB.",
        "Reached target Host and Network Name Lookups.",
        "Started Thermal Daemon Service.",
        "Started WPA supplicant.",
        "Finished Remove Stale Online ext4 Metadata Check Snapshots.",
        "Started Network Manager.",
        "Started Avahi mDNS/DNS-SD Stack.",
        "Started Switcheroo Control Proxy service.",
        "Reached target Network.",
        "Starting Network Manager Wait Online...",
        "Started Make remote CUPS printers available locally.",
        "Starting OpenVPN service...",
        "Started Service for snap application... canonical-livepatch.",
        "Started Dispatcher daemon for systemd-networkd.",
        "Finished Permit User Sessions.",
        "Starting GNOME Display Manager...",
        "Starting Hold until boot process finishes up...",
        "Started Authorization Manager.",
        "Starting Modem Manager...",
        "Finished Set console scheme.",
        "Started GNOME Display Manager.",
        "Started Accounts Service.",
        "Started Disk Manager.",
        "Started Login Service.",
        "Started User Manager for UID 1000..."
    )

    # Exibir cada mensagem
    foreach ($msg in $messages) {
        Show-LoadingLine -message $msg
    }

    # Indicar fim da animação
    Write-Host "Initialization complete."
}

# Executar a função de simulação de carregamento
Simulate-LinuxBoot
# ------------------/Simulação de carregamento de recursos----------------------------

# Inicia o PowerShell em modo Administrador com o comando desejado
Start-Process -FilePath "powershell.exe" -Verb runAs -ArgumentList "-Command", "& {$env:TEMP\QuickWindows\QuickWindows.cmd 0}"
exit

