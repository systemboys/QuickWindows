# Install_Transmission.ps1 - Executa o script de instalação de Transmission.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-30 às 19h58, Marcos Aurélio:
#   - Versão inicial, Instalação de Transmission.
# v0.0.2 2023-12-06 às 20h22, Marcos Aurélio:
#   - Atualização da URL do executável.
#
# Licença: GPL.

# Se o Transmission não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\Transmission"

if (Test-Path $directory) {
    Write-Host "Transmission is installed!"
} else {
    Write-Host "Transmission is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/Downloads/transmission-downloads.msi"
    $downloadPath = "$env:temp\transmission-downloads.msi"
    
    # Faz o download do Transmission
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Transmission
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
