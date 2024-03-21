# Install_CrystalDiskInfo.ps1 - Executa o script de instalação de Crystal Disk Info.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-03-21 às 18h13, Marcos Aurélio:
#   - Versão inicial, Instalação de Crystal Disk Info.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# ----------------------[Conteúdo do script abaixo]---------------------------

# Se o Crystal Disk Info não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\CrystalDiskInfo"

if (Test-Path $directory) {
    Write-Host "Crystal Disk Info is installed!"
} else {
    Write-Host "Crystal Disk Info is not installed! Starting installation process."
    Write-Host "File size: 9.9 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://download.anydesk.com/Crystal Disk Info.exe"
    $downloadPath = "$env:temp\CrystalDiskInfo.exe"
    
    # Faz o download do Crystal Disk Info
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o Crystal Disk Info
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
