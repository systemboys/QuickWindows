# Install_Shadow_Defender.ps1 - Executa o script de instalação de Shadow Defender.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-30 às 01h02, Marcos Aurélio:
#   - Versão inicial, Instalação de Shadow Defender e Deep Freeze Standard.
# v0.0.2 2023-12-06 às 20h58, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Se o Shadow_Defender não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\Shadow Defender"

if (Test-Path $directory) {
    Write-Host "Shadow Defender is installed!"
} else {
    Write-Host "Shadow Defender is not installed! Starting installation process."
    Write-Host "File size: 3.54 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/Shadow_Defender.exe"
    $downloadPath = "$env:temp\Shadow_Defender.exe"
    
    # Faz o download do Shadow_Defender
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Shadow_Defender
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
