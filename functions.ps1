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

# Função que cria os logs
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

# Função que testa a latência
# Para executar a função, basta chamar:
# Testar-Latencia -pingCount 24 -criticalTime 150
function Testar-Latencia {
    param (
        [int]$pingCount = 24,
        [int]$criticalTime = 150
    )

    # Limpa a tela
    Clear-Host

    # Executa o ping e exibe 24 linhas de resultado
    1..$pingCount | ForEach-Object {
        $pingResult = Test-Connection -ComputerName www.google.com -Count 1
        $seq = $_
        $bytes = 64
        $time = $pingResult.ResponseTime
        $ipAddress = $pingResult.Address

        # Verifica se o tempo de resposta é maior que o valor crítico
        if ($time -gt $criticalTime) {
            Write-Host "$bytes bytes from $($ipAddress): icmp_seq=$seq time=$time ms" -ForegroundColor Red
        } else {
            Write-Host "$bytes bytes from $($ipAddress): icmp_seq=$seq time=$time ms" -ForegroundColor Green
        }
        Start-Sleep -Milliseconds 500 # Pausa de 0,5 segundos entre os pings
    }
}

