# Install_Skype.ps1 - Executa o script de instalação de Skype.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o Skype.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-13 às 21h10, Marcos Aurélio:
#   - Versão inicial, Instalação do Skype.
# v0.0.2 2023-12-06 às 20h50, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Se o Skype não estiver instalado, faz o download e instala
$programFiles = [Environment]::GetEnvironmentVariable("ProgramFiles(x86)")
$directory = "$programFiles\Microsoft\Skype for Desktop"

if (Test-Path $directory) {
    Write-Host "Skype is installed!"
    } else {
        Write-Host "AnyDesk is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://download.anydesk.com/AnyDesk.exe"
    $downloadPath = "$env:temp\AnyDesk.exe"

    # Faz o download do AnyDesk
    $ProgressPreference = 'Continue'
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath

    # Instala o AnyDesk
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force

}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
