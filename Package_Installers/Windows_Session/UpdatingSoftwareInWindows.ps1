# UpdatingSoftwareInWindows.ps1 - Executa o script que atualiza os softwares no Windows.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de atualizar os softwares no Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-12 às 17h10, Marcos Aurélio:
#   - Versão inicial, atualizar os softwares no Windows.
#
# Licença: GPL.

# Se o YourPackage não estiver instalado, faz o download e instala
$winget = Get-Command winget -ErrorAction SilentlyContinue

if ($winget -eq $null) {
    $url = "https://github.com/microsoft/winget-cli/releases/download/v1.3.2691/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    $output = "C:\Temp\winget.msixbundle"
    Invoke-WebRequest -Uri $url -OutFile $output
    Add-AppxPackage -Path $output
}

# Atualizar softwares no Windows.
winget upgrade --all

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
