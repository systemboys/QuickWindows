# menu.ps1 - Executa o script de instalação do QuickWindows.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o QuickWindows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-13 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação do QuickWindows.
# v0.0.2 2023-11-13 às 16h00, Marcos Aurélio:
#   - Correção feita na verificação onde fecha a janela do Windows PowerShell.
# v0.0.3 2023-12-04 às 15h06, Marcos Aurélio:
#   - Opção para instalar o "AnyDesk" quando o usuário chamar o menu interativo com a ferramenta IRM.
# v0.0.4 2023-12-07 às 00h24, Marcos Aurélio:
#   - Se o AnyDesk tiver instalado, o script pergunta se quer executá-lo e, reabertura do Windows PowerShell após instalação do Git.
#
# Licença: GPL.

clear

# Ativar a execução de scripts no PowerShell
Set-ExecutionPolicy RemoteSigned

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
        Start-Process -FilePath "C:\Program Files (x86)\AnyDesk\AnyDesk.exe"
    }
    else {
        # exit
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
        Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
        # Instala o AnyDesk
        Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

        # Apagar o arquivo
        Remove-Item -Path $downloadPath -Force
    }
}

# Verifica se o pacote está instalado
Write-Host "Checking if Git exists on Windows..."
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    # Definição do arquivo
    $fileName="Git"
    $fileUrl="https://github.com/systemboys/_GTi_Support_/raw/main/Windows/VersionControlSoftware/Git_Setup.exe"
    $outputFileName="Git_Setup.exe"

    Write-Host "$fileName does not exist on Windows! Downloading the installer..."
    Write-Host "File size: 58.4 MB"

    # Baixa o instalador do pacote
    Invoke-WebRequest -Uri $fileUrl -OutFile "$env:TEMP\$outputFileName"

    Write-Host "Running the $fileName installer..."

    # Instala o pacote
    Start-Process -FilePath "$env:TEMP\$outputFileName" -Wait

    Write-Host "Deleting the $fileName installer..."

    # Remove o instalador do pacote
    Remove-Item "$env:TEMP\$outputFileName"

    # Fechar a janela do Windows PowerShell
    Write-Host "After installing Git, Windows PowerShell must be restarted!"
    Write-Host "Type the same command again or press the up directional arrow key."
    Write-Host
    Write-Host "Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Check if the directory exists
Write-Host "Check if QuickWindows exists, if so, delete it to clone it again..."
$programFiles = $env:TEMP
$directory = "$programFiles\QuickWindows"

# Verifica se o diretório existe antes de excluí-lo
if (Test-Path $directory) {
    Write-Host "The directory $directory exists."
    Remove-Item -Path $directory -Recurse -Force
} else {
    Write-Host "The directory $directory does not exist."
}

# Clonando o QuickWindows do repositório GitHub
Write-Host "Clonando o QuickWindows..."
# cd $env:TEMP ; git clone https://github.com/systemboys/QuickWindows.git ; cd .\QuickWindows\ ; .\QuickWindows.cmd 0

# Clonar e executar Windows PowerShell novamente com o comando
cd $env:TEMP ; git clone https://github.com/systemboys/QuickWindows.git ; cd .\QuickWindows\
# Inicia o PowerShell em modo Administrador com o comando desejado
Start-Process -FilePath "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Verb runAs -ArgumentList "-Command", "& {$env:TEMP\QuickWindows\QuickWindows.cmd}"
exit ; exit

