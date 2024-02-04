# FileCompressionForZip.ps1 - Executa o script de compressão para Zip.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de comprimir diretórios para arquivos Zip.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-02-03 às 20h24, Marcos Aurélio:
#   - Versão inicial, Compactação de diretório para aruqivo Zip.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Solicita ao usuário o diretório a ser copiado
do {
    $sourceDirectory = Join-Path $PSScriptRoot Read-Host "Enter the full path of the directory to be copied"
    if (-not $sourceDirectory) {
        Write-Host "Invalid path. Please provide a valid path."
    }
    elseif (-not (Test-Path $sourceDirectory -PathType Container)) {
        Write-Host "O diretório de origem não existe. Verifique o caminho e tente novamente."
    }
} while (-not $sourceDirectory -or -not (Test-Path $sourceDirectory -PathType Container))

# Solicita ao usuário o caminho onde o arquivo ZIP será salvo
do {
    $destinationZip = Join-Path $PSScriptRoot Read-Host "Enter the full path to the location where the ZIP file will be saved"
    if (-not $destinationZip) {
        Write-Host "Invalid path. Please provide a valid path."
    }
    elseif (-not (Test-Path $destinationZip -PathType Container)) {
        Write-Host "The destination directory does not exist. Check the path and try again."
    }
} while (-not $destinationZip -or -not (Test-Path $destinationZip -PathType Container))

# Obtém o nome base do diretório de origem e a data e hora atual para criar o nome do arquivo ZIP
$dateString = Get-Date -Format "yyyy-MM-dd HH-mm-ss"
$zipFileName = Join-Path $destinationZip ("$($sourceDirectory -split '\\|/' | Select-Object -Last 1) $dateString.zip")

# Cria uma instância de ZipArchive
$zipArchive = [System.IO.Compression.ZipFile]::Open($zipFileName, 'Create')

# Adiciona uma barra de progresso
Write-Progress -Activity "Compressing files" -Status "Starting" -PercentComplete 0

# Utiliza a classe ZipArchive para criar o arquivo ZIP
$files = Get-ChildItem -Path $sourceDirectory -File -Recurse
$totalFiles = $files.Count
$currentFile = 0

foreach ($file in $files) {
    # Atualiza a barra de progresso
    $currentFile++
    $percentComplete = ($currentFile / $totalFiles) * 100
    Write-Progress -Activity "Compressing files" -Status "In progress" -PercentComplete $percentComplete

    # Comprime o arquivo para o arquivo ZIP
    $entry = $zipArchive.CreateEntry($file.FullName -replace [regex]::Escape($sourceDirectory), 'Optimal')
    $stream = $entry.Open()
    $fileStream = [System.IO.File]::OpenRead($file.FullName)
    $fileStream.CopyTo($stream)
    $fileStream.Close()
    $stream.Close()
}

# Fecha o arquivo ZIP
$zipArchive.Dispose()

# Atualiza a barra de progresso para 100% e exibe a conclusão
Write-Progress -Activity "Compressing files" -Status "Completed" -PercentComplete 100
Write-Host "Backup completed successfully. The ZIP file is at: $zipFileName"

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
