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
$form.BackColor = "#1A1246"
$form.Icon = $Icon

#TBD
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(35,30)
$Button.Size = New-Object System.Drawing.Size(150,46)
$Button.Text = ''
$Button.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button.BackColor = "#FFFFFF"
$form.AcceptButton = $Button
$form.Controls.Add($Button)

#TBD
$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Point(35,75)
$Button1.Size = New-Object System.Drawing.Size(150,46)
$Button1.Text = ''
$Button1.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button1.BackColor = "#FFFFFF"
$form.AcceptButton = $Button1
$form.Controls.Add($Button1)

#TBD
$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Point(35,120)
$Button2.Size = New-Object System.Drawing.Size(150,46)
$Button2.Text = ''
$Button2.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button2.BackColor = "#FFFFFF"
$form.AcceptButton = $Button2
$form.Controls.Add($Button2)

#TBD
$Button3 = New-Object System.Windows.Forms.Button
$Button3.Location = New-Object System.Drawing.Point(35,165)
$Button3.Size = New-Object System.Drawing.Size(150,46)
$Button3.Text = ''
$Button3.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button3.BackColor = "#FFFFFF"
$form.AcceptButton = $Button3
$form.Controls.Add($Button3)

#Button Section
$Button.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/User/AD%20-%20Attribute%20Changer.ps1").Content
})

$Button1.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/User/AD%20-%20Unlock%20AD%20User.ps1").Content
})

$Button2.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/User/AD%20-%20Enable%20AD%20User.ps1").Content
})

$Button3.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/User/AD%20-%20Disable%20AD%20User.ps1").Content
})

$form.ShowDialog()
