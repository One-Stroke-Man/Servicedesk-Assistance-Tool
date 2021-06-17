Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#Losse onderdelen
$Icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe") #https://www.fourtop.nl/hubfs/cropped-FourTop-favicon-32x32.png

#Form Layout
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Servicedesk Assistance Tool'
$form.Size = New-Object System.Drawing.Size(600,400)
$form.StartPosition = 'CenterScreen'
$form.AutoSize = $True
$form.AutoSizeMode = "GrowOnly"
$form.BackColor = "#1A1246"
$form.Icon = $Icon

#Button AD Tools
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(125,80)
$Button.Size = New-Object System.Drawing.Size(150,46)
$Button.Text = 'AD Tools'
$Button.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button.BackColor = "#FFFFFF"
$form.AcceptButton = $Button
$form.Controls.Add($Button)

#Button Networking Tools
$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Point(125,130)
$Button1.Size = New-Object System.Drawing.Size(150,46)
$Button1.Text = 'Networking Tools'
$Button1.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button1.BackColor = "#FFFFFF"
$form.AcceptButton = $Button1
$form.Controls.Add($Button1)

#TBD
$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Point(125,180)
$Button2.Size = New-Object System.Drawing.Size(150,46)
$Button2.Text = 'Werkt nog niet'
$Button2.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button2.BackColor = "#FFFFFF"
$form.AcceptButton = $Button2
$form.Controls.Add($Button2)

#TBD
$Button3 = New-Object System.Windows.Forms.Button
$Button3.Location = New-Object System.Drawing.Point(125,230)
$Button3.Size = New-Object System.Drawing.Size(150,46)
$Button3.Text = 'Werkt nog niet'
$Button3.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button3.BackColor = "#FFFFFF"
$form.AcceptButton = $Button3
$form.Controls.Add($Button3)

#TBD
$Button4 = New-Object System.Windows.Forms.Button
$Button4.Location = New-Object System.Drawing.Point(300,80)
$Button4.Size = New-Object System.Drawing.Size(150,46)
$Button4.Text = 'Werkt nog niet'
$Button4.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button4.BackColor = "#FFFFFF"
$form.AcceptButton = $Button4
$form.Controls.Add($Button4)

#TBD
$Button5 = New-Object System.Windows.Forms.Button
$Button5.Location = New-Object System.Drawing.Point(300,130)
$Button5.Size = New-Object System.Drawing.Size(150,46)
$Button5.Text = 'Werkt nog niet'
$Button5.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button5.BackColor = "#FFFFFF"
$form.AcceptButton = $Button5
$form.Controls.Add($Button5)

#TBD
$Button6 = New-Object System.Windows.Forms.Button
$Button6.Location = New-Object System.Drawing.Point(300,180)
$Button6.Size = New-Object System.Drawing.Size(150,46)
$Button6.Text = 'Werkt nog niet'
$Button6.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button6.BackColor = "#FFFFFF"
$form.AcceptButton = $Button6
$form.Controls.Add($Button6)

#TBD
$Button7 = New-Object System.Windows.Forms.Button
$Button7.Location = New-Object System.Drawing.Point(300,230)
$Button7.Size = New-Object System.Drawing.Size(150,46)
$Button7.Text = 'Werkt nog niet'
$Button7.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Button7.BackColor = "#FFFFFF"
$form.AcceptButton = $Button7
$form.Controls.Add($Button7)

#Button Section
$Button.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/AD%20Tools.ps1").Content
})

$Button1.Add_Click({
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/Networking/Networking%20Tools.ps1").Content
})

$Button2.Add_Click({
     Invoke-expression (invoke-webrequest -uri "").Content
})

$Button3.Add_Click({
     Invoke-expression (invoke-webrequest -uri "").Content
})

$form.ShowDialog()
