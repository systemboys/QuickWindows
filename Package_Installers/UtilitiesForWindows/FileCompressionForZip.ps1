﻿# Solicita ao usuário o diretório a ser copiado
do {
    $sourceDirectory = Read-Host "Digite o caminho completo do diretório a ser copiado"
    if (-not $sourceDirectory) {
        Write-Host "Caminho inválido. Por favor, informe um caminho válido."
    }
    elseif (-not (Test-Path $sourceDirectory -PathType Container)) {
        Write-Host "O diretório de origem não existe. Verifique o caminho e tente novamente."
    }
} while (-not $sourceDirectory -or -not (Test-Path $sourceDirectory -PathType Container))

# Solicita ao usuário o caminho onde o arquivo ZIP será salvo
do {
    $destinationZip = Read-Host "Digite o caminho completo do local onde o arquivo ZIP será salvo"
    if (-not $destinationZip) {
        Write-Host "Caminho inválido. Por favor, informe um caminho válido."
    }
    elseif (-not (Test-Path $destinationZip -PathType Container)) {
        Write-Host "O diretório de destino não existe. Verifique o caminho e tente novamente."
    }
} while (-not $destinationZip -or -not (Test-Path $destinationZip -PathType Container))

# Obtém o nome base do diretório de origem e a data e hora atual para criar o nome do arquivo ZIP
$dateString = Get-Date -Format "yyyy-MM-dd HH-mm-ss"
$zipFileName = Join-Path $destinationZip ("$($sourceDirectory -split '\\|/' | Select-Object -Last 1) $dateString.zip")

# Cria uma instância de ZipArchive
$zipArchive = [System.IO.Compression.ZipFile]::Open($zipFileName, 'Create')

# Adiciona uma barra de progresso
Write-Progress -Activity "Comprimindo arquivos" -Status "Iniciando" -PercentComplete 0

# Utiliza a classe ZipArchive para criar o arquivo ZIP
$files = Get-ChildItem -Path $sourceDirectory -File -Recurse
$totalFiles = $files.Count
$currentFile = 0

foreach ($file in $files) {
    # Atualiza a barra de progresso
    $currentFile++
    $percentComplete = ($currentFile / $totalFiles) * 100
    Write-Progress -Activity "Comprimindo arquivos" -Status "Em andamento" -PercentComplete $percentComplete

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
Write-Progress -Activity "Comprimindo arquivos" -Status "Concluído" -PercentComplete 100
Write-Host "Backup concluído com sucesso. O arquivo ZIP está em: $zipFileName"
