# FileCompressionForZip.ps1 - Executa o script de compressão para Zip.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de comprimir diretórios para arquivos Zip.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-02-03 às 20h24, Marcos Aurélio:
#   - Versão inicial, Compactação de diretório para arquivo Zip.
# v1.0.1 2024-06-14 às 23h04, Marcos Aurélio:
#   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
# v1.1.1 2024-06-16 às 08h29, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.2.1 2024-07-28 às 01h18, Marcos Aurélio:
#   - Registro de logs.
#
# Licença: GPL.

# Configurações
# Tenta encontrar o arquivo config.json na pasta raiz
$configPath = "./config.json"
# Verifica se o arquivo existe no caminho atual
if (-not (Test-Path $configPath)) {
    # Se não existir, tenta o caminho relativo
    $configPath = "../../config.json"
}
# Importa as configurações do arquivo encontrado
$configData = Get-Content -Path $configPath | ConvertFrom-Json

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size($configData.PowerShellTerminalWidth, $configData.PowerShellTerminalHeight)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

# ------Importação da função e configuração de endereço e arquivo para Registrar log------
# Tentativa de importar a função a partir de diferentes caminhos
# Primeiro caminho (subindo dois níveis)
$functionPath = "..\..\functions.ps1"

# Verifica se o arquivo existe no primeiro caminho
if (-not (Test-Path $functionPath)) {
    # Se não existir, tenta o caminho alternativo (nível zero)
    $functionPath = ".\functions.ps1"
}

# Importa a função do caminho encontrado
. $functionPath

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

# Solicita ao usuário o diretório a ser copiado
do {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Digite o caminho completo do diretório a ser copiado"
    $sourceDirectory = Read-Host "Enter the full path of the directory to be copied"
    if (-not $sourceDirectory) {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Caminho inválido. Forneça um caminho válido."
        Write-Host "Invalid path. Please provide a valid path."
    }
    elseif (-not (Test-Path $sourceDirectory -PathType Container)) {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O diretório de origem não existe. Verifique o caminho e tente novamente."
        Write-Host "The source directory does not exist. Check the path and try again."
    }
} while (-not $sourceDirectory -or -not (Test-Path $sourceDirectory -PathType Container))

# Solicita ao usuário o caminho onde o arquivo ZIP será salvo
do {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Digite o caminho completo para o local onde o arquivo ZIP será salvo."
    $destinationZip = Read-Host "Enter the full path to the location where the ZIP file will be saved"
    if (-not $destinationZip) {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Caminho inválido. Forneça um caminho válido."
        Write-Host "Invalid path. Please provide a valid path."
    }
    elseif (-not (Test-Path $destinationZip -PathType Container)) {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "O diretório de destino não existe. Verifique o caminho e tente novamente."
        Write-Host "The destination directory does not exist. Check the path and try again."
    }
} while (-not $destinationZip -or -not (Test-Path $destinationZip -PathType Container))

# Obtém o nome base do diretório de origem e a data e hora atual para criar o nome do arquivo ZIP
$dateString = Get-Date -Format "yyyy-MM-dd HH-mm-ss"
$zipFileName = Join-Path $destinationZip ("$($sourceDirectory -split '\\|/' | Select-Object -Last 1) $dateString.zip")

# Adiciona uma barra de progresso
Write-Progress -Activity "Compressing files" -Status "Starting" -PercentComplete 0

# Utiliza a classe ZipArchive para criar o arquivo ZIP
try {
    $zipArchive = [System.IO.Compression.ZipFile]::Open($zipFileName, 'Create')

    # Restante do código que usa $zipArchive para adicionar arquivos ao ZIP

    # Fecha o arquivo ZIP
    $zipArchive.Dispose()
}
catch {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Erro ao usar System.IO.Compression.ZipFile: $_"
    Write-Host "Error using System.IO.Compression.ZipFile: $_"
}

# Utiliza a classe ZipArchive para criar o arquivo ZIP
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Criando arquivo ZIP: $zipFileName"
Write-Host "Creating ZIP archive: $zipFileName"
$files = Get-ChildItem -Path $sourceDirectory -File -Recurse

try {
    Compress-Archive -Path $files.FullName -DestinationPath $zipFileName -Force -CompressionLevel Optimal
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Arquivo ZIP criado com sucesso."
    Write-Host "ZIP archive created successfully."
}
catch {
    $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Erro ao criar arquivo ZIP: $_"
    Write-Host "Error creating ZIP archive: $_"
}

# Adiciona linhas vazias para espaçamento
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""

# Atualiza a barra de progresso para 100% e exibe a conclusão
Write-Progress -Activity "Compressing files" -Status "Completed" -PercentComplete 100
$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Backup concluído com sucesso. O arquivo ZIP está em: $zipFileName"
Write-Host "Backup completed successfully. The ZIP file is at: $zipFileName"

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Adiciona a instrução return para evitar a mensagem de erro
return
