# Install_YourPackage.ps1 - Executa o script de instalação de YourPackage.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-12-10 às 23h12, Marcos Aurélio:
#   - Versão inicial, Opção para colocar URL e iniciar download direto a partir do Windows PowerShell na sessão 'Internet / Downloads'.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

$validInput = $false

while (-not $validInput) {
    Write-Host "Enter the URL:"
    $url = Read-Host

    if (![string]::IsNullOrWhiteSpace($url)) {
        $validInput = $true
    } else {
        Write-Host "URL is mandatory. Please enter a valid URL."
    }
}

$validInput = $false

while (-not $validInput) {
    Write-Host "Enter destination:"
    $dest = Read-Host

    if (![string]::IsNullOrWhiteSpace($dest)) {
        $validInput = $true
    } else {
        Write-Host "Destination is mandatory. Please enter a valid destination."
    }
}

Write-Host "Iniciando o download..."
Start-BitsTransfer -Source $url -Destination $dest

Write-Host "Download completed!"

# Emitir Sequência de Beeps
$numeroDeBeeps = 10
for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
    [Console]::Beep(500, 300)
    Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
