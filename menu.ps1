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
#   - Correção feita na verificação onde fechar a janela do Windows PowerShell.
#
# Licença: GPL.

clear

# Ativar a execução de scripts no PowerShell
Set-ExecutionPolicy RemoteSigned

# Verifica se o pacote está instalado
Write-Host "Checking if Git exists on Windows..."
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    # Definição do arquivo
    $fileName="Git"
    $fileUrl="https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/Git-2.42.0.2-64-bit.exe"
    $outputFileName="Git_Setup.exe"

    Write-Host "$fileName does not exist on Windows! Downloading the installer..."

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
cd $env:TEMP ; git clone https://github.com/systemboys/QuickWindows.git ; cd .\QuickWindows\ ; .\QuickWindows.cmd 0

