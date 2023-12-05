# ScheduleWindowsShutdown.ps1 - Executa o script de ScheduleWindowsShutdown.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar agendamento de desligamento do Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-12-05 às 14h45, Marcos Aurélio:
#   - Versão inicial, agendamento de desligamento do Windows.
#
# Licença: GPL.

# Se o ScheduleWindowsShutdown não estiver instalado, faz o download e instala

Add-Type -AssemblyName System.Windows.Forms

# Cria uma janela de formulário
$form = New-Object System.Windows.Forms.Form
$form.Text = "Agendar desligamento do Windows"
$form.Width = 300
$form.Height = 150
$form.StartPosition = "CenterScreen"

# Cria um Label com a mensagem informativa
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(50,10)
$label.Size = New-Object System.Drawing.Size(250,20)
$label.Text = "Informe em quantos minutos ele deve desligar:"
$form.Controls.Add($label)

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
    # Verifica se o campo está vazio
    if ([string]::IsNullOrWhiteSpace($textBox.Text)) {
        [System.Windows.Forms.MessageBox]::Show("Por favor, digite um número!", "Campo Vazio", "OK", [System.Windows.Forms.MessageBoxIcon]::Warning)
    } else {
        # Quando o botão for clicado e o campo não estiver vazio, executa o comando no PowerShell
        $minutos = $textBox.Text
        $segundos = $minutos * 60

        $command = "shutdown -s -t $segundos"
        Invoke-Expression $command
    }
})
$form.Controls.Add($button)

# Mostra o formulário
$form.ShowDialog()
