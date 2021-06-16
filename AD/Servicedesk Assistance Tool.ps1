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

#Button Enable Account
$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Point(35,120)
$Button2.Size = New-Object System.Drawing.Size(150,46)
$Button2.Text = 'Enable AD Account'
$Button2.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $Button2
$form.Controls.Add($Button2)

#Button Enable Account
$Button3 = New-Object System.Windows.Forms.Button
$Button3.Location = New-Object System.Drawing.Point(35,165)
$Button3.Size = New-Object System.Drawing.Size(150,46)
$Button3.Text = 'Disable AD Account'
$Button3.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $Button3
$form.Controls.Add($Button3)

#Button Section
$Button.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/Attribute_Changer.ps1").Content
})

$Button1.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/Unlock%20ADUser.ps1").Content
})

$Button2.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/Enable%20AD%20User.ps1").Content
})

$Button3.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/Disable%20AD%20User.ps1").Content
})

$form.ShowDialog()
