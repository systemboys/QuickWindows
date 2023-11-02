# Install_Winget.ps1 - Para instalação do Winget
#
# Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
# Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o Winget.
# ---------------------------------------------------------------
# Histórico:
# v0.0.7 2023-10-31 às 23h55, Marcos Aurélio:
#   - Versão inicial, script para instalar o Winget via Powershell.
#
# Licença: GPL.

# Verifica se o Winget já está instalado
if (-not (Get-Command -Name winget -ErrorAction SilentlyContinue)) {
    # Faz o download do instalador do Winget
    $url = "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    $output = "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    Invoke-WebRequest -Uri $url -OutFile $output

    # Instala o Winget
    Add-AppxPackage -Path $output -ForceApplicationShutdown

    # Remove o arquivo de instalação
    Remove-Item -Path $output -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

