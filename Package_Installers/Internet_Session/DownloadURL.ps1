$validInput = $false

while (-not $validInput) {
    Write-Host "Digite a URL:"
    $url = Read-Host

    if (![string]::IsNullOrWhiteSpace($url)) {
        $validInput = $true
    } else {
        Write-Host "URL é obrigatória. Por favor, digite uma URL válida."
    }
}

$validInput = $false

while (-not $validInput) {
    Write-Host "Digite o destino:"
    $dest = Read-Host

    if (![string]::IsNullOrWhiteSpace($dest)) {
        $validInput = $true
    } else {
        Write-Host "Destino é obrigatório. Por favor, digite um destino válido."
    }
}

Write-Host "Iniciando o download..."
Start-BitsTransfer -Source $url -Destination $dest
