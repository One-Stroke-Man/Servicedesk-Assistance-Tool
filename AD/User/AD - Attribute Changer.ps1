#Add the WPF type
Add-Type -AssemblyName PresentationFramework
===
Add-Type -AssemblyName PresentationFramework

#region XAML
[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window"
    Title="Attribute Changer"
    Background = "#1A1246"
    SizeToContent="WidthAndHeight" >

    <Grid x:Name="Grid">
        <Grid.RowDefinitions>
            <RowDefinition Height="23"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="23"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="23"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="23"/>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="50"/>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition Width="20"/>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition Width="50"/>
        </Grid.ColumnDefinitions>
      
        <Label x:Name = "UsernameLabel"
            Content = "Username"
            Grid.Column = "1"
            Grid.Row = "1"
            Foreground = "#FFFFFF"
        />
		<TextBox x:Name = "UserNameTextBox"
            Width = "200"
            Grid.Column = "1"
            Grid.Row = "2"
        />
        <Button x:Name = "SearchButton"
            Content = "Search"
            Grid.Column = "3"
            Grid.Row = "2"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Label x:Name = "FirstNameLabel"
            Content = "First Name"
            Grid.Column = "1"
            Grid.Row = "4"
            Foreground = "#FFFFFF"
		/>
        <TextBox x:Name = "FirstNameTextBox"
            Width = "200"
            Grid.Column = "1"
            Grid.Row = "5"
		/>
        <Label x:Name = "LastNameLabel"
            Content = "Last Name"
            Grid.Column = "3"
            Grid.Row = "4"
            Foreground = "#FFFFFF"
		/>
        <TextBox x:Name = "LastNameTextBox"
            Width = "200"
            Grid.Column = "3"
            Grid.Row = "5"
        />
        <Label x:Name = "DepartmentLabel"
            Content = "Department"
            Grid.Column = "1"
            Grid.Row = "6"
            Foreground = "#FFFFFF"
		/>
        <TextBox x:Name = "DepartmentTextBox"
            Width = "200"
            Grid.Column = "1"
            Grid.Row = "7"
		/>
        <Label x:Name = "CompanyLabel"
            Content = "Company"
            Grid.Column = "3"
            Grid.Row = "6"
            Foreground = "#FFFFFF"
        />
        <TextBox x:Name = "CompanyTextBox"
            Width = "200"
            Grid.Column = "3"
            Grid.Row = "7"
		/>
        <Label x:Name = "EmailLabel"
            Content = "Email"
            Grid.Column = "1"
            Grid.Row = "8"
            Foreground = "#FFFFFF"
        />
        <TextBox x:Name = "EmailTextBox"
            Width = "200"
            Grid.Column = "1"
            Grid.Row = "9"
        />
        <Label x:Name = "ProxyLabel"
            Content = "ProxyAddress"
            Grid.Column = "1"
            Grid.Row = "10"
            Foreground = "#FFFFFF"
        />
        <TextBox x:Name = "ProxyTextBox"
            Width = "200"
            Grid.Column = "1"
            Grid.Row = "11"
		/>
        <Button x:Name = "SetButton"
            Content = "Set"
            Grid.Column = "3"
            Grid.Row = "13"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
    </Grid>
</Window>
"@
#endregion

#region Variables

#Collect the xaml
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

#Grab tho controls into variables
$UserNameTB = $window.FindName("UserNameTextBox")
$FirstNameTB = $window.FindName("FirstNameTextBox")
$LastNameTB = $window.FindName("LastNameTextBox")
$DepartmentTB = $window.FindName("DepartmentTextBox")
$CompanyTB = $window.FindName("CompanyTextBox")
$EmailTB = $window.FindName("EmailTextBox")
$ProxyTB = $window.FindName("ProxyTextBox")
$SearchButton = $window.FindName("SearchButton")
$SetButton = $window.FindName("SetButton")

#endregion

#region Control the focus

#Set the search button as default when in the username text box
$UserNameTB.Add_GotFocus({
    $SetButton.IsDefault = $false
    $SearchButton.IsDefault = $true
})

#Set the set button as default when in the attribute text boxes
$FirstNameTB.Add_GotFocus({
    $SetButton.IsDefault = $true
    $SearchButton.IsDefault = $false
})
$LastNameTB.Add_GotFocus({
    $SetButton.IsDefault = $true
    $SearchButton.IsDefault = $false
})
$DepartmentTB.Add_GotFocus({
    $SetButton.IsDefault = $true
    $SearchButton.IsDefault = $false
})
$CompanyTB.Add_GotFocus({
    $SetButton.IsDefault = $true
    $SearchButton.IsDefault = $false
})
$EmailTB.Add_GotFocus({
    $SetButton.IsDefault = $true
    $SearchButton.IsDefault = $false
})
$ProxyTB.Add_GotFocus({
    $SetButton.IsDefault = $true
    $SearchButton.IsDefault = $false
})
#endregion

#region Clicks

#Find the user when the search button is pressed
$SearchButton.Add_Click({
    $user = $null
    $user = Get-ADUser -Identity $UserNameTB.Text -Properties Department,Company,Mail,ProxyAddresses
    If($user){
        $FirstNameTB.Text = $user.GivenName
        $LastNameTB.Text = $user.SurName
        $DepartmentTB.Text = $user.Department
        $CompanyTB.Text = $user.Company
        $EmailTB.Text = $user.Mail
        $ProxyTB.Text = $user.ProxyAddresses
        }
    Else{
        $FirstNameTB.Text = $LastNameTB.Text = $TitleTB.Text = $managerTB.Text = ""
    }
})

#Set the user attributes when the set button is pressed
$SetButton.Add_Click({
    $user = Get-ADUser $UserNameTB.Text
    If($user){
        $UserSplat = @{
            Identity = $user.SamAccountName
            GivenName = If($FirstNameTB.Text){$FirstNameTB.Text}Else{$null}
            SurName = If($LastNameTB.Text){$LastNameTB.Text}Else{$null}
            Department = If($DepartmentTB.Text){$DepartmentTB.Text}Else{$null}
            Company = If($CompanyTB.Text){$CompanyTB.Text}Else{$null}
            Email = If($EmailTB.Text){$EmailTB.Text}Else{$null}
        }
        Set-ADUser @UserSplat
        If($ProxyTB.Text){
            Set-ADUser -identity $user.SamAccountName -replace @{ProxyAddresses=$ProxyTB.Text}
        }Else{$null}

    }Else{
        Write-Host 'No User'
    }
})
#endregion

#Display the dialog
$window.ShowDialog()
