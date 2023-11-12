# Install_Google_Chrome.ps1 - Executa o script de instalação o Google Chrome.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o Google Chrome.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-11 às 23h50, Marcos Aurélio:
#   - Versão inicial, Instalação o Google Chrome.
#
# Licença: GPL.

# Se o Google Chrome não estiver instalado, faz o download e instala
$programFiles = $env:ProgramFiles
$directory = "$programFiles\Google\Chrome"

if (Test-Path $directory) {
    Write-Host "Google Chrome is installed!"
} else {
    Write-Host "Google Chrome is not installed! Starting installation process."

    # Link do download e o diretório Temp
    $downloadUrl = "https://public.sn.files.1drv.com/y4mKY8Yd9s9K_w46eB-OOidMe1r98l6xmMZ0HY3gGhBLIJeGrWwsu56sLDOLUluxkiDv0XYa-D-TotfBQ2Kk9xja0stgjbNxfr7mo_EccoPed0F8QiZF2O0d8rLo0VBt2GaIW4ZfoWImA3785aDLNGIev-C66w8l45NOc7AtalEO6n88Q7G-qkZ4NrO9Wbzsm-mKY-bQgXTApNjC2pOTqxpUMyCQcbuxwYCSlyB5aqIrxs?AVOverride=1"
    $downloadPath = "$env:temp\ChromeSetup.exe"
    
    # Faz o download do Google Chrome
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o Google Chrome
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
