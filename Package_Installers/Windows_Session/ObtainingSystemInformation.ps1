# ObtainingSystemInformation.ps1 - Executa o script de Obter informações do Sistema via comando.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-02-04 às 23h06, Marcos Aurélio:
#   - Versão inicial, Obter informações do Sistema via comando.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Função para exibir informações em um quadro
function Show-InfoFrame {
    param(
        [string]$title,
        [string]$content
    )

    Write-Host ("_" * 100)
    Write-Host ("{0,-100}" -f $title)
    Write-Host ("{0,-100}" -f $content)
}

# Obter informações do processador
$processorInfo = Get-WmiObject -Class Win32_Processor | Select-Object Name, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
$processorContent = "Name: $($processorInfo.Name)", "Max Clock Speed: $($processorInfo.MaxClockSpeed) MHz", "Cores: $($processorInfo.NumberOfCores)", "Logical Processors: $($processorInfo.NumberOfLogicalProcessors)"

# Obter informações de memória
$memoryInfo = Get-WmiObject -Class Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
$memoryContent = "Total Physical Memory: {0:N2} GB" -f ($memoryInfo.Sum)

# Obter informações gerais do sistema
$systemInfo = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object Manufacturer, Model, TotalPhysicalMemory
$systemContent = "Manufacturer: $($systemInfo.Manufacturer)", "Model: $($systemInfo.Model)", "Total Physical Memory: {0:N2} GB" -f ($systemInfo.TotalPhysicalMemory / 1GB)

# Exibir informações em quadros
Show-InfoFrame -title "Processor Info" -content ($processorContent -join "`n")
Show-InfoFrame -title "Memory Info" -content $memoryContent
Show-InfoFrame -title "System Info" -content ($systemContent -join "`n")

Write-Host ("_" * 100)

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
