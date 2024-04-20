# Install_Microsoft_Edge.ps1 - Executa o script de instalação de Microsoft Edge.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de instalar o Microsoft Edge.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-11 às 23h36, Marcos Aurélio:
#   - Versão inicial, opção para instalar o Microsoft Edge.
# v0.0.2 2023-11-12 às 11h00, Marcos Aurélio:
#   - Correção, foi reescrito o script para baixar e executar o instalador do Microsoft Edge.
# v0.0.3 2023-12-06 às 20h49, Marcos Aurélio:
#   - Foi informado o tamanho do executável.
#
# Licença: GPL.

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size(100, 30)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Se o Microsoft Edge não estiver instalado, faz o download e instala
$programFiles = [Environment]::GetEnvironmentVariable("ProgramFiles(x86)")
$directory = "$programFiles\Microsoft\Edge\Application"

if (Test-Path $directory) {
    Write-Host "Microsoft Edge is installed!"
} else {
    Write-Host "Microsoft Edge is not installed! Starting installation process."
    Write-Host "File size: 1.52 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://github.com/systemboys/_GTi_Support_/raw/main/Windows/Internet/MicrosoftEdgeSetup.exe"
    $downloadPath = "$env:temp\MicrosoftEdgeSetup.exe"

    # Faz o download do Microsoft Edge
    Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath

    # Emitir Sequência de Beeps
    $numeroDeBeeps = 10
    for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
        [Console]::Beep(500, 300)
        Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
    }

    # Instala o Microsoft Edge
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

