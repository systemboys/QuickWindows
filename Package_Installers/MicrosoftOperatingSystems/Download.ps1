# Download.ps1 - Executa o script de Download de Softwares.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar o Download de Softwares de instalação do Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-12-11 às 20h51, Marcos Aurélio:
#   - Versão inicial, Download de Softwares.
# v0.0.2 2023-12-13 às 20h51, Marcos Aurélio:
#   - Emitir Sequência de Beeps após Downloads.
# v0.0.3 2024-04-22 às 17h14, Marcos Aurélio:
#   - Correção dos links na sessão.
#
# Licença: GPL.

# Recebe um argumento que pode ser um número
param (
    [Parameter(Mandatory=$true)]
    [int]$numero
)

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size(100, 30)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# [1]=Windows 7, todas as versões
# [2]=Windows 7 Lite
# [3]=Windows 10 Pro 32bits
# [4]=Windows 10 Pro 64bits
# [5]=Windows 10 1909 PRO MSDN LITE Build
# [6]=Windows 11 Pro
# [7]=Windows Server 2022

# Windows 7, todas as versões
$url1 = "https://public.bl.files.1drv.com/y4mMwYiwgIIrBIM9zrMDimxq_b81p6_GRjIa1tTRlwuD9Q3HmzAyVj8JaT7WbwSsjRw0JrcKE9IF7u6aPosYCQ1SdlbimveZezHbJmwnAJ1R5vMPB-H7O_ztDRlCpSXkwrfldqmgIvRUf5SYO6c5zBmiRaP0mdv7ZA4S5IhtvRw9rGjr4TTbzQCMW05yMCoaQyq836ssv-jVPV6_4d2wnUVE6SqEc7J_02wGtEndEjKjGE?AVOverride=1"

# Windows 7 Lite
$url2 = "https://public.bl.files.1drv.com/y4mP8oye0OixNX7-sgjkvcUb9K4vesGFp4VqGYSzCqbgUzM_-k1Epv1FlCi6yrOnkdmu5vXYZUxt969TXw8g5fQ4U7uNow9sZb13EmqQ7INSWPCjBEvn0caQKN3ix_EDU-J8Y4mmYeavdq-szk_5XEDm6gIEvrbb2zPNMgNmQDQ6-XS-9kqj3NuGOkST3G1mbq9Ke1uOmSXnL9FvOqgrHUJJ2BUC277y-JFXe73fRP6KBg?AVOverride=1"

# Windows 10 Pro 32bits
$url3 = "https://public.bl.files.1drv.com/y4mvy3t3TcsJTm3-gVfl-kKdqwV4L_rYrFX1gCWL4EOPIhRaiTgZEXtY0lrHcALBSSgbZEzooU5B9iav19EMQ0iMl99xqYupUfYQETCI7ICcdefpJyvORm_YptS0vC56YSJHygIiIiFPdThnDp3FreQMbVUPmrESiilCz7dWDZ756Dy-zO_sQCKmQiHH0taQVLBLswZwmi04iBZYrCAIv6bDae5ibeFPtNMWFw8QhzdrRk?AVOverride=1"

# Windows 10 Pro 64bits
$url4 = "https://public.bl.files.1drv.com/y4m6FfHrVIlxt7eDGIyTqLpbZMleKHpXhUfK9W2LLzUrP5b6sttOxqU4n8QRmgnSeN2ZlB2iCDaYp2B2ZP9mEYiLQUbyN3IeC0rYcUFjXPDvpc49HvjOxKboILExoe7sWgnEQgspvDdSYuUSkz83xe8Y8X8egUo9gPVSt3ca4qIhfz3Eu_DTlsxsNSgchYz7MVvYQeKmy6RUsXHGhSHI3tcDPCBBYxh_m_JXBlE5TKo3XA?AVOverride=1"

# Windows 10 1909 PRO MSDN LITE Build
$url5 = "https://public.bl.files.1drv.com/y4mEtlBKNbYRWF2aLu0sCdcbsu5bB57yLw5qgOu_DpVmLaXcF4y5lYtY5ME73ROXLAwZn_fhEVNhvLidcb4dUDPZnQkywxD2jxQo688ihCud6h4DiJuqYyw6Wh2mHGTC0k5LXgmFF8uDroScJJ-6t5HIISJjTGZ6U4yxLzTbv7YYHujZI9BpSvrlSdkS_BdAtpue6IcoD1ZqhdFHFDsQJYFlJfFYrzQgNa1lO79bbPCdlU?AVOverride=1"

# Windows 11 Pro
$url6 = "https://public.sn.files.1drv.com/y4mQB_PJ4K4fxcFrxerCi3J80mg8MeWoLO9j07Yq4RMqvGGcu-SGr6yJFeLbWYLRE2lC3VCq2_tEILMqPRNx06m9C-fHallM0lh0R4XPru8kdr908y5nzXifFdBxOnPYdTIALzOkTjEQ0pfYJGKl7-nQVOz4DKl6ryJiGfeIT-PfA8I_08B7HEmznoN7iADU3VU4QQg9PTDSu1W31PisiigPtgHorueC73PcsXdF9-w774?AVOverride=1"

# Windows Server 2022
$url7 = "https://public.bl.files.1drv.com/y4mfU_2hWR9dErFq8oZIebEOkWKrvVbp2nuhInN5eP17MXw94CWhIhhls5CmbvbodCNSSxaYFa78qYhDfzeMdUsBvI8X10Nw4keNTFVR8_aNyV08XmRjx61wsQ_GjbN5XJQm-pIbFInOZUtphzpyVgWUfT8Ke6ZxQ-TPBWlJ0X00iazHtHCTxyYahnt8ZBMXHqTz0Hqnf4M8bPfVO64jSXr3LtrMTRjl634jJks1qcUjHY?AVOverride=1"

# Verificação e download do arquivo com base na escolha
switch ($numero) {
    1 { $url = $url1 } # Windows 7, todas as versões
    2 { $url = $url2 } # Windows 7 Lite
    3 { $url = $url3 } # Windows 10 Pro 32bits
    4 { $url = $url4 } # Windows 10 Pro 64bits
    5 { $url = $url5 } # Windows 10 1909 PRO MSDN LITE Build
    6 { $url = $url6 } # Windows 11 Pro
    7 { $url = $url7 } # Windows Server 2022
    default {
        Write-Host "Invalid option. Please choose a valid option."
        exit
    }
}

# Solicitação do local de destino
$destination = Read-Host "Enter the full destination path to save the file"

# Verificação se o destino foi fornecido
if (-not $destination) {
    Write-Host "Destination is mandatory. Please provide the destination path."
    exit
}

# Iniciando o download em uma nova janela do PowerShell
Write-Host "Starting the download in a new window..."
Start-BitsTransfer -Source $url -Destination $destination

Write-Host "Download completed!"

# Emitir Sequência de Beeps
$numeroDeBeeps = 10
for ($i = 0; $i -lt $numeroDeBeeps; $i++) {
    [Console]::Beep(500, 300)
    Start-Sleep -Milliseconds 200  # Aguarda um curto período entre os beeps
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
