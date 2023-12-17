# Install_RustDesk.ps1 - Executa o script de instalação de RustDesk.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação do
# RustDesk para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-29 às 16h56, Marcos Aurélio:
#   - Versão inicial, Instalação de RustDesk.
# v0.0.2 2023-12-02 às 08h33, Marcos Aurélio:
#   - Foi feito uma correção no link do download do arquivo.
# v0.0.2 2023-12-06 às 20h22, Marcos Aurélio:
#   - Foi informado o tamanho do executável e atualizada a URL do executável.
#
# Licença: GPL.

# Se o RustDesk não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\RustDesk"

if (Test-Path $directory) {
    Write-Host "RustDesk is installed!"
} else {
    Write-Host "RustDesk is not installed! Starting installation process."
    Write-Host "File size: 19.8 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/RemoteAccess/RustDesk_Setup.exe"
    $downloadPath = "$env:temp\RustDesk_Setup.exe"
    
    # Faz o download do RustDesk
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath
    
    # Instala o RustDesk
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

# Emitir Sequência de Beeps
$numeroDeBeeps = 10
for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
    [Console]::Beep(500, 300)
    Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

