# Install_Google_Earth_Pro.ps1 - Executa o script que baixa o instalar o Google Earth Pro.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de baixar o instalar o Google Earth Pro.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-12 às 15h20, Marcos Aurélio:
#   - Versão inicial, Instalação do Google Earth Pro.
#
# Licença: GPL.

# Se o YourPackage não estiver instalado, faz o download e instala
$installed = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.DisplayName -eq "Google Earth Pro"}
if ($installed -eq $null) {
    $temporaryDirectory = $env:TEMP
    $url = "https://dl.google.com/earth/client/advanced/current/GoogleEarthProWin.exe"
    $output = "$temporaryDirectory\GoogleEarthProWin.exe"
    Invoke-WebRequest -Uri $url -OutFile $output

    # Define o tamanho do arquivo para a barra de progresso
    $fileSize = (Invoke-WebRequest -Uri $url).Headers.'Content-Length'
    $fileSizeInMB = [math]::Round($fileSize / 1MB, 2)

    # Cria a barra de progresso personalizada
    Write-Progress -Activity "Baixando Google Earth Pro" -Status "0% concluído" -PercentComplete 0
    $downloadedBytes = 0
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFileCompleted += { Write-Progress -Activity "Baixando Google Earth Pro" -Status "100% concluído" -PercentComplete 100 }
    $webClient.DownloadProgressChanged += { 
        $downloadedBytes = $_.BytesReceived
        $percentComplete = [math]::Round(($downloadedBytes / $fileSize) * 100, 2)
        $status = "$percentComplete% concluído"
        Write-Progress -Activity "Baixando Google Earth Pro" -Status $status -PercentComplete $percentComplete
    }
    $webClient.DownloadFileAsync($url, $output)

    # Aguarda o download ser concluído
    while ($webClient.IsBusy) {
        Start-Sleep -Seconds 1
    }

    # Instala o Google Earth Pro
    Start-Process -FilePath $output -ArgumentList "/S /v/qn"
    Remove-Item $output
} else {
    Write-Host "Google Earth Pro já está instalado."
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
