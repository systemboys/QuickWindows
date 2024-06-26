# menu.ps1 - Executa o script de instalação do QuickWindows.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o QuickWindows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.1 2023-11-13 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação do QuickWindows.
# v1.0.2 2023-11-13 às 16h00, Marcos Aurélio:
#   - Correção feita na verificação onde fecha a janela do Windows PowerShell.
# v1.1.2 2023-12-04 às 15h06, Marcos Aurélio:
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
# v1.2.8 2024-06-25 às 23h50, Marcos Aurélio:
#   - Novo script de instalação silenciosa do Git.
#
# Licença: GPL.

clear

# Verifica se o Windows PowerShell está sendo executado como administrador
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script needs to be run as administrator."
    Start-Process powershell -Verb RunAs -ArgumentList "-Command irm qw.gti1.com.br/menu.ps1 | iex"
    exit
}

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Ativar a execução de scripts no PowerShell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

# Se o AnyDesk não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)"
$directory = "$programFiles\AnyDesk"

if (Test-Path $directory) {
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
    }
}

# ------------------[Ícone na Área de trabalho]---------------------------

# --- Criar diretório em ambiente de usuário ---
# Define o nome do diretório
$dirName = "GTiSupport"

# Define o caminho completo do diretório
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName

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
$command = "irm qw.gti1.com.br/menu.ps1 | iex"

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
# ------------------[/Ícone na Área de trabalho]---------------------------

# ---------------[Verifica se o Winget está instalado no Windows]---------------
if (Get-Command winget -ErrorAction SilentlyContinue) {
    $GitInstallation = 1 # Define qual script será executado
    Write-Host "Winget is installed!"
} else {
    $GitInstallation = 2 # Define qual script será executado
    Write-Host "Winget is not installed!"
}

# -------------[Executar atalho na Área de trabalho]-----------------
function RunShortcut {
    # Caminho completo para o atalho na Área de Trabalho
    $desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory)
    $shortcut = Join-Path $desktopPath "GTi Support.lnk"

    # Verifica se o atalho existe
    if (Test-Path $shortcut) {
        # Executa o atalho
        Invoke-Item $shortcut
    } else {
        Write-Host "The shortcut was not found."
    }
}
# -------------[/Executar atalho na Área de trabalho]-----------------

if ($GitInstallation -eq 1) {
    # ---------------[Novo script de instalação silenciosa do Git]-----------------
    # Função para verificar se um programa está instalado
    function Is-ProgramInstalled {
        param (
            [string]$program
        )
        Get-Command $program -ErrorAction SilentlyContinue
        return $?
    }
    
    # Função para exibir um indicador de progresso
    function Show-Progress {
        param (
            [int]$seconds
        )
        $dots = "."
        for ($i = 0; $i -lt $seconds; $i++) {
            Write-Host -NoNewline $dots
            Start-Sleep -Seconds 1
        }
        Write-Host ""
    }
    
    # Verificar se o Git está instalado
    if (-not (Is-ProgramInstalled "git")) {
        Write-Host "Git is not installed. Checking the available installer..."
    
        # Verificar se o winget está instalado
        if (-not (Is-ProgramInstalled "winget")) {
            Write-Host "winget is not installed. Checking out Chocolatey..."
    
            # Verificar se o Chocolatey está instalado
            if (-not (Get-Command "choco" -ErrorAction SilentlyContinue)) {
                Write-Host "Chocolatey is not installed. Installing Chocolatey..."
                
                # Instalar Chocolatey
                Set-ExecutionPolicy Bypass -Scope Process -Force
                [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
                Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
            }
    
            # Instalar Git usando Chocolatey de forma silenciosa
            Write-Host "Starting the Git installation using Chocolatey..."
            choco install git -y --execution-timeout 0 --force --package-parameters="'/NoShellIntegration /NoAutoCrlf /SILENT'"
            Show-Progress 5  # Indicador de progresso simples (5 segundos)
            # Chame a função para executar o atalho
            RunShortcut
            # Chame a função para executar o atalho
            RunShortcut
        } else {
            # Instalar Git usando winget de forma silenciosa
            Write-Host "Starting Git installation using winget..."
            winget install --id Git.Git -e --source winget --silent
            Show-Progress 5  # Indicador de progresso simples (5 segundos)
            # Chame a função para executar o atalho
            RunShortcut
            exit
        }
    } else {
        Write-Host "Git is already installed."
    }
    # ---------------[/Novo script de instalação silenciosa do Git]-----------------
} elseif ($variavel -eq 2) {
    # ---------------[Script antigo que instala o Git]-----------------
    # ---------------[Verifica se o Git está instalado no Windows (versões 10 e 11)]---------------
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
        # Definição do arquivo
        $fileName="Git"
        $fileUrl="https://github.com/systemboys/_GTi_Support_/raw/main/Windows/VersionControlSoftware/Git_Setup.exe"
        $outputFileName="Git_Setup.exe"
    
        Write-Host "$fileName does not exist on Windows! Downloading the installer..."
        Write-Host "File size: 58.4 MB"
    
        # Baixa o instalador do Git
        Start-BitsTransfer -Source $fileUrl -Destination "$env:TEMP\$outputFileName"
    
        Write-Host "Running the $fileName installer..."
    
        # Instala o Git
        Start-Process -FilePath "$env:TEMP\$outputFileName" -Wait
    
        Write-Host "Deleting the $fileName installer..."
    
        # Remove o instalador do Git
        Remove-Item "$env:TEMP\$outputFileName"
    
        # Fechar a janela do Windows PowerShell
        Write-Host "After installing Git, Windows PowerShell must be restarted!"
        Write-Host "Type the same command again or press the up directional arrow key."
        Write-Host
        Write-Host "There is a GTi Support shortcut on the Desktop!"
        Write-Host
        # Chame a função para executar o atalho
        RunShortcut
        exit
    }
    # ---------------[/Script antigo que instala o Git]-----------------
}
# ---------------[/Fim da verificação do caminho padrão de instalação do Git em outras versões do Windows]---------------

# ------------------[Verifique se o QuickWindows existe] -----------------------------
$programFiles = $env:TEMP
$filePath = "$programFiles\QuickWindows\QuickWindows.cmd"

if (Test-Path $filePath) {
    Write-Host "Starting QuickWindows..."
    Set-Location -Path "$env:TEMP\QuickWindows"
} else {
    # --------[Verificar se o arquivo "QuickWindows.cmd" existe, se não existir, apagar o diretório "QquicoWindows"]----------
    # Define o caminho do diretório e do arquivo
    $dirPath = "$env:TEMP\QuickWindows"
    $filePath = "$dirPath\QuickWindows.cmd"

    # Verifica se o diretório existe
    if (Test-Path $dirPath) {
        # Se o diretório existe, verifica se o arquivo não existe
        if (-not (Test-Path $filePath)) {
            # Se o arquivo não existe, remove o diretório
            Write-Host "Removing the $dirPath directory..."
            Remove-Item -Recurse -Force $dirPath
        }
    } else {
        Write-Host "The $dirPath directory does not exist."
    }
    # --------[/Verificar se o arquivo "QuickWindows.cmd" existe, se não existir, apagar o diretório "QquicoWindows"]----------
    Write-Host "Cloning QuickWindows..."
    # Clonar e executar Windows PowerShell novamente com o comando
    Set-Location -Path $env:TEMP ; git clone https://github.com/systemboys/QuickWindows.git ; Set-Location -Path .\QuickWindows\
}
# ------------------[/Verifique se o QuickWindows existe] -----------------------------

# Inicia o PowerShell em modo Administrador com o comando desejado
Start-Process -FilePath "powershell.exe" -Verb runAs -ArgumentList "-Command", "& {$env:TEMP\QuickWindows\QuickWindows.cmd 0}"
exit

