Write-Host "Digite a URL:"
$url = Read-Host

Write-Host "Digite o destino:"
$dest = Read-Host

if (![string]::IsNullOrWhiteSpace($url) -and ![string]::IsNullOrWhiteSpace($dest)) {
    Write-Host "Iniciando o download..."
    Start-BitsTransfer -Source $url -Destination $dest
} else {
    Write-Host "URL e destino são obrigatórios."
}
