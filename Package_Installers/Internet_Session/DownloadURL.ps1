Write-Host "Digite a URL:"
$url = Read-Host

Write-Host "Digite o destino:"
$dest = Read-Host

if (![string]::IsNullOrWhiteSpace($url) -and ![string]::IsNullOrWhiteSpace($dest)) {
    Write-Host "Iniciando o download..."
    $fileName = [System.IO.Path]::GetFileName($url)
    $extension = [System.IO.Path]::GetExtension($fileName)
    $destWithExtension = Join-Path -Path $dest -ChildPath $fileName

    Start-BitsTransfer -Source $url -Destination $destWithExtension
} else {
    Write-Host "URL e destino são obrigatórios."
}
