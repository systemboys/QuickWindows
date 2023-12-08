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
    Start-BitsTransfer -Source $url -Destination $output
    Start-Process -FilePath $output -ArgumentList "/S /v/qn"
    Remove-Item $output
} else {
    Write-Host "Google Earth Pro já está instalado."
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
