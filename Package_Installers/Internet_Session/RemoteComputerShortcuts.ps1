# RemoteComputerShortcuts.ps1 - Executa o script de criação de atalhos para computadores remotos.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na criação de atalhos para computadores remotos.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-09-06 às 17h41, Marcos Aurélio:
#   - Versão inicial, script de criação de atalhos para computadores remotos na Área de trabalho do Windows.
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

# ----------------------[Conteúdo do script abaixo]---------------------------

# Se o AnyDesk não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)"
$directory = "$programFiles\AnyDesk"

if (Test-Path $directory) {
    # ---Script para criar os atalhos dos computadores remotos informados pelo usuário-------
    # Função para criar atalho
    function Create-Shortcut {
        param (
            [string]$id,
            [string]$name,
            [string]$type
        )
        
        # Caminho do Desktop
        $desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory)
        
        # Caminho do diretório "Remote computers"
        $remoteComputersDir = Join-Path -Path $desktopPath -ChildPath "Remote computers"
        
        # Verifica se o diretório existe, senão cria
        if (-not (Test-Path -Path $remoteComputersDir)) {
            New-Item -Path $remoteComputersDir -ItemType Directory | Out-Null
        }
        
        # Definir o ícone com base no tipo de dispositivo (Desktop ou Notebook)
        if ($type -eq "d") {
            $iconUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/icons/others/Desktop_icon.ico"  # Ícone para Desktop
        } elseif ($type -eq "n") {
            $iconUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/icons/others/Laptop_icon.ico"  # Ícone para Notebook
        } else {
            Write-Host "Invalid device type for $name. Shortcut will not be created." -ForegroundColor Red
            $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Tipo de dispositivo inválido para $name. O atalho não será criado."
            return
        }
        
        # Caminho do diretório para salvar o ícone
        $iconDir = "$env:USERPROFILE\GTiSupport\RemoteComputers"
        
        # Verificar se o diretório para os ícones existe, senão cria
        if (-not (Test-Path -Path $iconDir)) {
            New-Item -Path $iconDir -ItemType Directory -Force | Out-Null
        }

        # Caminho local para salvar o ícone
        $iconPath = "$iconDir\$($name) ID-$($id).ico"
        
        # Baixar o ícone se não existir
        if (-not (Test-Path $iconPath)) {
            Invoke-WebRequest -Uri $iconUrl -OutFile $iconPath
            $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "ID and Name [$($name), $($id)]"
        }
        
        # Nome do atalho
        $shortcutName = $name
        $shortcutPath = Join-Path -Path $remoteComputersDir -ChildPath "$shortcutName.lnk"
        
        # Criar um objeto WScript.Shell
        $shell = New-Object -ComObject WScript.Shell
        
        # Criar atalho
        $shortcut = $shell.CreateShortcut($shortcutPath)
        $shortcut.TargetPath = "$env:SystemDrive\Program Files (x86)\AnyDesk\AnyDesk.exe"
        $shortcut.Arguments = $id
        $shortcut.IconLocation = $iconPath
        $shortcut.Description = "Access computer $name"
        $shortcut.Save()
    }

    # Script principal

    # Loop para solicitar IDs até que o usuário forneça algo válido
    do {
        $input = Read-Host "Enter the ID of one or more machines (Ex.: 1602937869,PC Sala,d; 1622437764,PC Reception,n;)"
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Insira o ID de uma ou mais máquinas (Ex.: 1602937869,PC Sala,d; 1622437764,PC Recepção,n;)"
        if ([string]::IsNullOrWhiteSpace($input)) {
            Write-Host "Please enter your computer ID and name!" -ForegroundColor Red
            $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Por favor, insira o ID e o nome do seu computador!"
        }
    } while ([string]::IsNullOrWhiteSpace($input))

    # Separar os computadores com base em ";"
    $computers = $input -split ";"

    # Iterar sobre cada computador e criar o atalho
    foreach ($computer in $computers) {
        # Verifica se a entrada não está vazia
        if (-not [string]::IsNullOrWhiteSpace($computer)) {
            # Separar ID, nome e tipo com base em ","
            $parts = $computer -split ","
            if ($parts.Count -eq 3) {
                $id = $parts[0].Trim()
                $name = $parts[1].Trim()
                $type = $parts[2].Trim().ToLower()  # Tipo (d ou n) em minúsculas
                
                # Criar o atalho
                Create-Shortcut -id $id -name $name -type $type
            } else {
                Write-Host "Invalid input: $computer" -ForegroundColor Red
                $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Entrada inválida: $computer!"
            }
        }
    }

    # Mensagem final
    $dir = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory) + "\Remote computers"
    Write-Host "Shortcuts successfully created in $dir directory! Press a key to exit..."
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Atalhos criados com sucesso no diretório $dir!"
    Read-Host
    # ---/Script para criar os atalhos dos computadores remotos informados pelo usuário-------
} else {
    Write-Host "AnyDesk is not installed!"
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "AnyDesk não está instalado!"
}

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
