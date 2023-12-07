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
    Write-Host "WinToHDD is installed!"
} else {
    Write-Host "WinToHDD is not installed! Starting installation process."
    Write-Host "File size: 9.32 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/WinToHDD.exe"
    $downloadPath = "$env:temp\WinToHDD.exe"
    
    # Faz o download do WinToHDD
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o WinToHDD
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
