# RunPowerShellCommands.ps1 - Execução Interativa de Comandos no PowerShell
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2023-11-01 às 22h50, Marcos Aurélio:
#   - Versão inicial, Execução Interativa de Comandos no PowerShell:
#     Como Permitir que os Usuários Execute Comandos Personalizados.
# v1.1.0 2023-11-29 às 22h50, Marcos Aurélio:
#   - Script de Interação: Janela de Comando Interativa para Execução de Comandos.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size(30, 7)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Script de Interação: Janela de Comando Interativa para Execução de Comandos
function ExecutarComando {
    param (
        [string]$comando
    )

    # Abrir uma nova janela do PowerShell e executar o comando
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "powershell"
    $psi.Arguments = "-NoExit -Command `"$comando`""
    [System.Diagnostics.Process]::Start($psi) | Out-Null
}

Add-Type -AssemblyName System.Windows.Forms

# Cria uma janela de formulário
$form = New-Object System.Windows.Forms.Form
$form.Text = "Executar Comando"
$form.Width = 310
$form.Height = 130
$form.StartPosition = "CenterScreen"

# Cria um Label com a mensagem informativa
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,10)
$label.Size = New-Object System.Drawing.Size(275,20)
$label.Text = "Digite o comando:"
$form.Controls.Add($label)

# Cria um campo de texto para o comando
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,30)
$textBox.Size = New-Object System.Drawing.Size(275,20)
$textBox.Text = "Digite o comando aqui..."
$textBox.Add_Enter({
    # Limpa o texto inicial quando o usuário clicar no campo
    if ($textBox.Text -eq "Digite o comando aqui...") {
        $textBox.Text = ""
    }
})
$form.Controls.Add($textBox)

# Cria um botão "Enviar"
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(100,60)
$button.Size = New-Object System.Drawing.Size(100,23)
$button.Text = "Enviar"
$button.Add_Click({
    # Verifica se o campo está vazio
    if ([string]::IsNullOrWhiteSpace($textBox.Text) -or $textBox.Text -eq "Digite o comando aqui...") {
        [System.Windows.Forms.MessageBox]::Show("Por favor, digite um comando!", "Campo Vazio", "OK", [System.Windows.Forms.MessageBoxIcon]::Warning)
    } else {
        # Quando o botão for clicado e o campo não estiver vazio, executa o comando na nova janela do PowerShell
        $command = $textBox.Text
        ExecutarComando -comando $command
    }
})
$form.Controls.Add($button)

# Mostra o formulário
$form.ShowDialog()
# /Script de Interação: Janela de Comando Interativa para Execução de Comandos

