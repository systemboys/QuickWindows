# Install_AnyDesk.ps1 - Executa o script de instalaÃ§Ã£o de AnyDesk.
#
# Autor: Marcos AurÃ©lio R. da Silva <systemboys@hotmail.com>
# ManutenÃ§Ã£o: Marcos AurÃ©lio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalaÃ§Ã£o do
# AnyDesk para Windows.
# ---------------------------------------------------------------
# HistÃ³rico:
# v0.0.1 2023-10-31 Ã s 01h10, Marcos AurÃ©lio:
#   - VersÃ£o inicial, InstalaÃ§Ã£o de AnyDesk.
# v0.0.2 2023-11-01 Ã s 16h54, Marcos AurÃ©lio:
#   - CorreÃ§Ã£o da verificaÃ§Ã£o da existÃªncia do AnyDesk no Windows.
# v0.0.2 2023-11-01 Ã s 22h55, Marcos AurÃ©lio:
#   - CorreÃ§Ã£o na linha de comando que apaga o arquivo de instalaÃ§Ã£o
#     do AnyDesk baixado.
# v0.0.3 2023-12-06 Ã s 20h43, Marcos AurÃ©lio:
#   - Foi informado o tamanho do executÃ¡vel e atualizada a URL.
#
# LicenÃ§a: GPL.

# Se o AnyDesk nÃ£o estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files (x86)"
$directory = "$programFiles\AnyDesk"

if (Test-Path $directory) {
    # Carrega a biblioteca do .NET Framework para criar a pop-up
    [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null

    # Define a mensagem, o tÃ­tulo e os botÃµes da pop-up
    $message = "O AnyDesk jÃ¡ estÃ¡ instalado, deseja executÃ¡-lo?"
    $title = "AnyDesk"
    $buttons = [Microsoft.VisualBasic.MsgBoxStyle]::YesNo

    # Mostra a pop-up ao usuÃ¡rio e guarda a resposta em uma variÃ¡vel
    $response = [Microsoft.VisualBasic.Interaction]::MsgBox($message, $buttons, $title)

    # Verifica se a resposta do usuÃ¡rio foi "Sim"
    if ($response -eq "Yes") {
        # Executa o AnyDesk
        Start-Process -FilePath "C:\Program Files (x86)\AnyDesk\AnyDesk.exe"
    }
    else {
        exit
    }
} else {
    Write-Host "AnyDesk is not installed! Starting installation process."
    Write-Host "File size: 5.27 MB"

    # Link do download e o diretÃ³rio Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/RemoteAccess/AnyDesk.exe"
    $downloadPath = "$env:temp\AnyDesk.exe"
    
    # Faz o download do AnyDesk
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o AnyDesk
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

