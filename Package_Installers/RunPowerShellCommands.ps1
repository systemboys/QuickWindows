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
# v0.0.1 2023-11-01 às 22h50, Marcos Aurélio:
#   - Versão inicial, Execução Interativa de Comandos no PowerShell:
#     Como Permitir que os Usuários Execute Comandos Personalizados.
# v0.0.1 2023-11-29 às 22h50, Marcos Aurélio:
#   - Script de Interação: Janela de Comando Interativa para Execução de Comandos.
#
# Licença: GPL.

# Script de Interação: Janela de Comando Interativa para Execução de Comandos
Add-Type -AssemblyName System.Windows.Forms

# Cria uma janela de formulário
$form = New-Object System.Windows.Forms.Form
$form.Text = "Executar Comando"
$form.Width = 300
$form.Height = 150
$form.StartPosition = "CenterScreen"

# Cria um campo de texto para o comando
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(50,30)
$textBox.Size = New-Object System.Drawing.Size(200,20)
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
$button.Location = New-Object System.Drawing.Point(100,70)
$button.Size = New-Object System.Drawing.Size(100,23)
$button.Text = "Enviar"
$button.Add_Click({
    # Verifica se o campo está vazio
    if ([string]::IsNullOrWhiteSpace($textBox.Text) -or $textBox.Text -eq "Digite o comando aqui...") {
        [System.Windows.Forms.MessageBox]::Show("O campo é obrigatório. Por favor, digite um comando.", "Campo Vazio", "OK", [System.Windows.Forms.MessageBoxIcon]::Warning)
    } else {
        # Quando o botão for clicado e o campo não estiver vazio, executa o comando no PowerShell
        $command = $textBox.Text
        Invoke-Expression $command
    }
})
$form.Controls.Add($button)

# Mostra o formulário
$form.ShowDialog()
# /Script de Interação: Janela de Comando Interativa para Execução de Comandos

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

