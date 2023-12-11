Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form 
$form.Text = 'Download File'
$form.Size = New-Object System.Drawing.Size(300,200) 
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'Iniciar download'
$okButton.Add_Click({
    $url = $urlBox.Text
    $dest = $destBox.Text

    if (![string]::IsNullOrWhiteSpace($url) -and ![string]::IsNullOrWhiteSpace($dest))
    {
        $form.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $form.Close()
    }
    else
    {
        [System.Windows.Forms.MessageBox]::Show("URL e destino sao obrigatorios.", "Erro", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancelar'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$urlLabel = New-Object System.Windows.Forms.Label
$urlLabel.Location = New-Object System.Drawing.Point(10,20) 
$urlLabel.Size = New-Object System.Drawing.Size(280,20) 
$urlLabel.Text = 'Digite a URL:'
$form.Controls.Add($urlLabel) 

$urlBox = New-Object System.Windows.Forms.TextBox 
$urlBox.Location = New-Object System.Drawing.Point(10,40) 
$urlBox.Size = New-Object System.Drawing.Size(260,20) 
$form.Controls.Add($urlBox) 

$destLabel = New-Object System.Windows.Forms.Label
$destLabel.Location = New-Object System.Drawing.Point(10,70) 
$destLabel.Size = New-Object System.Drawing.Size(280,20) 
$destLabel.Text = 'Digite o destino:'
$form.Controls.Add($destLabel) 

$destBox = New-Object System.Windows.Forms.TextBox 
$destBox.Location = New-Object System.Drawing.Point(10,90) 
$destBox.Size = New-Object System.Drawing.Size(260,20) 
$form.Controls.Add($destBox) 

$form.Topmost = $true

$form.Add_Shown({ $form.Activate() })
$result = $form.ShowDialog()

while ($result -ne [System.Windows.Forms.DialogResult]::OK)
{
    $result = $form.ShowDialog()

    if ($result -eq [System.Windows.Forms.DialogResult]::OK)
    {
        # Invoke-WebRequest -Uri $url -OutFile $dest
        Start-BitsTransfer -Source $url -Destination $dest
    }
}
