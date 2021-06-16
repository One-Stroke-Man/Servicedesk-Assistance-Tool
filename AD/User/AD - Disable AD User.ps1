Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#Losse onderdelen
$Icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe")

#Form Layout
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Unlock AD User'
$form.Size = New-Object System.Drawing.Size(600,400)
$form.StartPosition = 'CenterScreen'
$form.AutoSize = $True
$form.AutoSizeMode = "GrowOnly"
$form.BackColor = "White"
$form.Icon = $Icon

#AD Users Listbox
$lstADUsers                      = New-Object system.Windows.Forms.ListBox
$lstADUsers.width                = 356
$lstADUsers.height               = 220
$lstADUsers.location             = New-Object System.Drawing.Point(9,18)
$lstADUsers.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$lstADUsers.AutoSize = $false
$user = Get-ADUser -Filter * | Where { $_.Enabled -eq $True} | Select DistinguishedName | foreach{
    [void]$lstADUsers.Items.Add($_.distinguishedname)

 }
 $user | Format-Table Name,DistinguishedName

#Disable Account Button
$btnDisableAccount               = New-Object system.Windows.Forms.Button
$btnDisableAccount.text          = "Disable"
$btnDisableAccount.width         = 100
$btnDisableAccount.height        = 30
$btnDisableAccount.location      = New-Object System.Drawing.Point(265,249)
$btnDisableAccount.Font          = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$btnDisableAccount.Add_Click({
    $x = $lstADUsers.SelectedItems
    foreach ($user in $x) {
        Set-ADUser -Identity "$x" -Enabled $false
    }
})

#Adds all elements into th eframe
$form.controls.AddRange(@($lstADUsers,$btnDisableAccount))

#Shows the frame
$form.ShowDialog()