Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#Losse onderdelen
$Icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe")


#Form Layout
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Servicedesk Assistance Tool'
$form.Size = New-Object System.Drawing.Size(600,400)
$form.StartPosition = 'CenterScreen'
$form.AutoSize = $True
$form.AutoSizeMode = "GrowOnly"
$form.BackColor = "White"
$form.Icon = $Icon

#Button Attribute Changer
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(35,30)
$Button.Size = New-Object System.Drawing.Size(150,46)
$Button.Text = 'Attribute Changer'
$Button.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $Button
$form.Controls.Add($Button)

#Button Unlock Account
$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Point(35,75)
$Button1.Size = New-Object System.Drawing.Size(150,46)
$Button1.Text = 'Unlock AD Account'
$Button1.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $Button1
$form.Controls.Add($Button1)

#Button Section
$Button.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/Attribute_Changer.ps1").Content
})

$Button1.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/Unlock%20ADUser.ps1").Content
})


$form.ShowDialog()
