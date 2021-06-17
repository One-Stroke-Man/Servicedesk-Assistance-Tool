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