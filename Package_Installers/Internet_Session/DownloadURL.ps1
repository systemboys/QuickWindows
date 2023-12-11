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

$validInput = $false

while (-not $validInput) {
    Write-Host "Digite a URL:"
    $url = Read-Host

    if (![string]::IsNullOrWhiteSpace($url)) {
        $validInput = $true
    } else {
        Write-Host "URL é obrigatória. Por favor, digite uma URL válida."
    }
}

$validInput = $false

while (-not $validInput) {
    Write-Host "Digite o destino:"
    $dest = Read-Host

    if (![string]::IsNullOrWhiteSpace($dest)) {
        $validInput = $true
    } else {
        Write-Host "Destino é obrigatório. Por favor, digite um destino válido."
    }
}

Write-Host "Iniciando o download..."
Start-BitsTransfer -Source $url -Destination $dest
