# Run_CrystalDiskInfo_Portable.ps1 - Executa o script de Download e execução de Crystal Disk Info portable.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de baixar e executar o Crystal Disk Info portable no Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-03-21 às 21h46, Marcos Aurélio:
#   - Versão inicial, Download e execução de Crystal Disk Info portable.
# v0.0.2 2024-06-14 às 23h12, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v0.0.3 2024-06-16 às 22h20, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
#
# Licença: GPL.

# Configurações
# Tenta encontrar o arquivo config.json na pasta raiz
$configPath = "./config.json"
# Verifica se o arquivo existe no caminho atual
if (-not (Test-Path $configPath)) {
    # Se não existir, tenta o caminho relativo
    $configPath = "../../config.json"
}
# Importa as configurações do arquivo encontrado
$configData = Get-Content -Path $configPath | ConvertFrom-Json

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size($configData.PowerShellTerminalWidth, $configData.PowerShellTerminalHeight)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o Crystal Disk Info não estiver instalado, faz o download e instala
$programFiles = "$env:temp"
$directory = "$programFiles\CrystalDiskInfo"

if (Test-Path $directory) {
    Write-Host "Crystal Disk Info is installed!"
} else {
    Write-Host "Crystal Disk Info is not installed! Starting installation process."
    Write-Host "File size: 5.69 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/UtilitiesForWindows/CrystalDiskInfo.zip"
    $downloadPath = "$env:temp\CrystalDiskInfo.zip"
    
    # Faz o download do Crystal Disk Info
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = $configData.beepsOnDownloads
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }

    # Extrair o arquivo compactado (.zip)
    # Definir o caminho do diretório de destino para a extração
    $extractPath = $env:temp

    # Extrair o arquivo zip para o diretório de destino
    Expand-Archive -Path $downloadPath -DestinationPath $extractPath

    # Definir o caminho do arquivo exe dentro do diretório descompactado
    $exePath = Join-Path -Path $extractPath -ChildPath "$extractPath\CrystalDiskInfo\DiskInfo64.exe"
    # /Extrair o arquivo compactado (.zip)
    
    # Executar o Crystal Disk Info
    Start-Process -FilePath "$extractPath\CrystalDiskInfo\DiskInfo64.exe" -Wait

    # Apagar o arquivo e o diretório
    Remove-Item -Path $downloadPath -Force
    Remove-Item -Path "$extractPath\CrystalDiskInfo" -Recurse -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
