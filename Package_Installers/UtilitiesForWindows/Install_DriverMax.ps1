# Install_DriverMax.ps1 - Executa o script de instalação de DriverMax.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-12-29 às 01h41, Sandro de Souza Silva (Servo Informática):
#   - Versão inicial, Instalação de DriverMax.
# v0.0.2 2023-12-29 às 21h34, Marcos Aurélio:
#   - Modificação onde o PowerShell pergunta onde deve salvar o download do arquivo.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o DriverMax não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)\Innovative Solutions"
$directory = "$programFiles\DriverMax"

if (Test-Path $directory) {
    Write-Host "DriverMax is installed!"
} else {
    Write-Host "DriverMax is not installed! Starting installation process."
    Write-Host "File size: 7.01 MB"

    # Pedir ao usuário para digitar o caminho onde deseja salvar o arquivo
    do {
        $saveLocation = Read-Host "Enter the path where you want to save the file (Ex.: C:\Users\UserPC\Downloads)"

        # Verifica se o campo está vazio
        if ([string]::IsNullOrWhiteSpace($saveLocation)) {
            Write-Host "Please enter a valid path."
        }
        else {
            # Verifica se o caminho existe e é válido
            if (-not (Test-Path (Split-Path -Path $saveLocation))) {
                Write-Host "Invalid path or directory does not exist. Please enter a valid path."
            }
        }
    } until (-not [string]::IsNullOrWhiteSpace($saveLocation) -and (Test-Path (Split-Path -Path $saveLocation)))

    # Define o caminho completo para o arquivo de download
    $downloadPath = Join-Path -Path $saveLocation -ChildPath "DriverMax_setup.exe"
    
    # Faz o download do DriverMax
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/DriverMax_setup.exe"
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o DriverMax
    Start-Process -FilePath $downloadPath -Wait
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
