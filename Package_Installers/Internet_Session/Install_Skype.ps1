# Install_Skype.ps1 - Executa o script de instalação de Skype.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o Skype.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-13 às 21h10, Marcos Aurélio:
#   - Versão inicial, Instalação do Skype.
# v0.0.2 2023-12-06 às 20h50, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Se o Skype não estiver instalado, faz o download e instala
$programFiles = [Environment]::GetEnvironmentVariable("ProgramFiles(x86)")
$directory = "$programFiles\Microsoft\Skype for Desktop"

if (Test-Path $directory) {
    Write-Host "Skype is installed!"
} else {
    Write-Host "Skype is not installed! Starting installation process."
    Write-Host "File size: 84.7 MB"
    
    # Definindo o tamanho do arquivo para acompanhar o progresso
    $fileSizeInBytes = 84.7 * 1MB  # 84.7 MB em bytes
    
    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/Skype-setup.exe"
    $downloadPath = "$env:temp\Skype-setup.exe"
    
    # Função para atualizar a barra de progresso
    function Update-DownloadProgress {
        param(
            [int]$BytesDownloaded,
            [int]$TotalBytes
        )
        $progress = $BytesDownloaded / $TotalBytes * 100
        Write-Progress -Activity "Downloading Skype" -Status "Downloading..." -PercentComplete $progress
    }
    
    # Faz o download do Skype
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath -PassThru -UseBasicParsing -TimeoutSec 300 -Progress ({ Update-DownloadProgress $_.BytesDownloaded $fileSizeInBytes })
    
    # Instala o Skype
    Start-Process -FilePath "$downloadPath" -Wait
    
    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
