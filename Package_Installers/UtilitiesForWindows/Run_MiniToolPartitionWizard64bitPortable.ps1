# Run_MiniToolPartitionWizard64bitPortable.ps1 - Executa o script de Download e execução de MiniTool Partition Wizard v12 64bit portable.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de baixar e executar o MiniTool Partition Wizard v12 64bit portable no Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-01-20 às 01h10, Marcos Aurélio:
#   - Versão inicial, Download e execução de MiniTool Partition Wizard v12 64bit portable.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o MiniTool Partition Wizard não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\YourPackage"

if (Test-Path $directory) {
    Write-Host "YourPackage is installed!"
} else {
    Write-Host "YourPackage is not installed! Starting installation process."
    Write-Host "File size: 9.9 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/MiniTool-Partition-Wizard-v12-64bit-portable.zip"
    $downloadPath = "$env:temp\MiniTool-Partition-Wizard-v12-64bit-portable.zip"
    
    # Faz o download do MiniTool Partition Wizard
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }
    
    # Instala o MiniTool Partition Wizard
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
