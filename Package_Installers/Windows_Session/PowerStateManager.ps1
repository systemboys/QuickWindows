# PowerStateManager.ps1 - Executa o script de execução de Gerenciador de Energia.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar a execução de comandos no Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2024-04-16 às 00h43, Marcos Aurélio:
#   - Versão inicial, execução de Gerenciador de Energia (Desligar ou Reiniciar).
#
# Licença: GPL.

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size(100, 30)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# ----------------------[Conteúdo do script abaixo]---------------------------

if ($args.Count -eq 0) {
    Write-Host "No argument provided. Use 1 to turn off the computer and 2 to restart."
} else {
    $argumento = $args[0]
    if ($argumento -eq 1) {
        Stop-Computer -Force
    } elseif ($argumento -eq 2) {
        Restart-Computer -Force
    } else {
        Write-Host "Unknown argument. Use 1 to turn off the computer and 2 to restart."
    }
}

# ---------------------[/Conteúdo do script acima]---------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
