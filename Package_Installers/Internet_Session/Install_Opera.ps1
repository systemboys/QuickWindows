# Install_Opera.ps1 - Executa o script de instalação de Opera.
#
# URL: https://github.com/github_user/project_on_github.git
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-10-31 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação de Opera.
#
# Licença: GPL.

# Se o Opera não estiver instalado, faz o download e instala
$programFiles = [Environment]::GetEnvironmentVariable("ProgramFiles(x86)")
$directory = "$programFiles\Opera"

if (Test-Path $directory) {
    Write-Host "Opera is installed!"
} else {
    Write-Host "Opera is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://net.geo.opera.com/opera/stable/windows?utm_source=%28direct%29&utm_medium=doc&utm_campaign=%28direct%29&http_referrer=missing&utm_site=opera_com&utm_lastpage=opera.com%2F&dl_token=66151060"
    $downloadPath = "$env:temp\OperaSetup.exe"
    
    # Faz o download do Opera
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Opera
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

