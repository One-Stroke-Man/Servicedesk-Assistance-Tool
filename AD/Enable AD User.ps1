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
$user = Search-ADAccount -AccountDisabled | foreach{
    [void]$lstADUsers.Items.Add($_.distinguishedname)

 }
 $user | Format-Table Name,DistinguishedName

#Disable Account Button
$btnEnable               = New-Object system.Windows.Forms.Button
$btnEnable.text          = "Enable"
$btnEnable.width         = 100
$btnEnable.height        = 30
$btnEnable.location      = New-Object System.Drawing.Point(265,249)
$btnEnable.Font          = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$btnEnable.Add_Click({
    $x = $lstADUsers.SelectedItems
    foreach ($user in $x) {
        Set-ADUser -Identity "$x" -Enabled $true
    }
})

#Adds all elements into th eframe
$form.controls.AddRange(@($lstADUsers,$btnEnable))

#Shows the frame
$form.ShowDialog()