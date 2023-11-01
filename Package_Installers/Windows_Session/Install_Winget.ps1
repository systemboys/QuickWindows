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
