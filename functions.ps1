# functions.ps1 - Armazena algumas funções utilizadas no sistema.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade algumas funções executadas pelo sistema.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-07-12 às 22h56, Marcos Aurélio:
#   - Versão inicial, Função que cria logs do sistema.
#
# Licença: GPL.

# MyFunction.ps1

function QWLogFunction {
    param (
        [string]$Address,
        [string]$FileName,
        [string]$Message
    )

    # Define o caminho completo do arquivo de log
    $logFilePath = Join-Path -Path $Address -ChildPath $FileName

    # Cria a linha de log com a data e hora atual
    $logLine = "$(Get-Date -Format 'yyyy/MM/dd HH:mm:ss') - $Message"

    # Verifica se o arquivo já existe
    if (Test-Path -Path $logFilePath) {
        # Adiciona a nova linha ao arquivo existente
        Add-Content -Path $logFilePath -Value $logLine
    } else {
        # Cria um novo arquivo e adiciona a linha
        New-Item -Path $logFilePath -ItemType File
        Set-Content -Path $logFilePath -Value $logLine
    }

    # Retorna o caminho completo do arquivo de log
    return $logFilePath
}

