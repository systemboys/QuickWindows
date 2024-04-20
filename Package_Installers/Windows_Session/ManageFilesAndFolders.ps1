# ManageFilesAndFolders.ps1 - Executa o script de execução de ManageFilesAndFolders.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-30 às 12h03, Marcos Aurélio:
#   - Versão inicial, Abrir Gerenciador de Arquivos com Endereço Específico.
#
# Licença: GPL.

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size(100, 30)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

Add-Type -AssemblyName System.Windows.Forms

# Cria uma caixa de diálogo para inserir o local
$form = New-Object System.Windows.Forms.Form
$form.Text = "Informe o local"
$form.Size = New-Object System.Drawing.Size(300,150)
$form.StartPosition = "CenterScreen"

$label = New-Object System.Windows.Forms.Label
$label.Text = "Digite o local:"
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(10,10)
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,30)
$textBox.Size = New-Object System.Drawing.Size(265,20)
$form.Controls.Add($textBox)

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(100,70)
$button.Size = New-Object System.Drawing.Size(100,30)
$button.Text = "Enviar"
$button.Add_Click({
    $address = $textBox.Text
    if ([string]::IsNullOrEmpty($address)) {
        [System.Windows.Forms.MessageBox]::Show("Por favor, informe um local!", "Erro", "OK", "Error")
    } else {
        # Abrir o Gerenciador de Arquivos com o local fornecido
        Start-Process "explorer.exe" ([Environment]::GetFolderPath("Desktop"))
        Start-Process "explorer.exe" $address
        $form.Close()
    }
})
$form.Controls.Add($button)

$form.ShowDialog()

