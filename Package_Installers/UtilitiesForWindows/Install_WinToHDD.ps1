# Install_WinToHDD.ps1 - Executa o script de instalação de WinToHDD.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-29 às 10h50, Marcos Aurélio:
#   - Versão inicial, Instalação de WinToHDD.
# v0.0.2 2023-12-06 às 21h00, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Se o WinToHDD não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files\Hasleo"
$directory = "$programFiles\WinToHDD"

if (Test-Path $directory) {
    # Carrega a biblioteca do .NET Framework para criar a pop-up
    [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null

    # Define a mensagem, o título e os botões da pop-up
    $message = "WinToHDD is already installed, do you want to run it?"
    $title = "WinToHDD"
    $buttons = [Microsoft.VisualBasic.MsgBoxStyle]::YesNo

    # Mostra a pop-up ao usuário e guarda a resposta em uma variável
    $response = [Microsoft.VisualBasic.Interaction]::MsgBox($message, $buttons, $title)

    # Verifica se a resposta do usuário foi "Sim"
    if ($response -eq "Yes") {
        # Executa o WinToHDD
        Start-Process -FilePath "$env:SystemDrive\Program Files\Hasleo\WinToHDD\bin\WinToHDD.exe"
    }
    else {
        exit
    }
    # Write-Host "WinToHDD is installed!"
} else {
    Write-Host "WinToHDD is not installed! Starting installation process."
    Write-Host "File size: 9.32 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/WinToHDD.exe"
    $downloadPath = "$env:temp\WinToHDD.exe"
    
    # Faz o download do WinToHDD
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o WinToHDD
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
