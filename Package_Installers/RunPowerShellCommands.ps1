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
#
# Licença: GPL.

# Execução Interativa de Comandos no PowerShell

# Solicita ao usuário que digite um comando por meio do cmdlet
# $command = Read-Host "Enter a command to be executed in PowerShell"
# Invoke-Expression $command

# ------------------------------------------
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
$form.Controls.Add($textBox)

# Cria um botão "Enviar"
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(100,70)
$button.Size = New-Object System.Drawing.Size(100,23)
$button.Text = "Enviar"
$button.Add_Click({
    # Quando o botão for clicado, executa o comando no PowerShell
    $command = $textBox.Text
    Invoke-Expression $command
})
$form.Controls.Add($button)

# Mostra o formulário
$form.ShowDialog()
# ------------------------------------------

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

