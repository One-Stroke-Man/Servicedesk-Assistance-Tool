#Add the WPF type
Add-Type -AssemblyName PresentationFramework

#region XAML
[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window"
    Title="User Management"
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
        />
        <Label x:Name = "OutputLabel"
            Content = "Output"
            Grid.Column = "1"
            Grid.Row = "4"
		/>
        <TextBox x:Name = "OutputTextBox"
            Height = "200"
            Width = "200"
            Grid.Column = "1"
            Grid.Row = "5"
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
$OutputTB = $window.FindName("OutputTextBox")
$SearchButton = $window.FindName("SearchButton")

#region Control the focus

#endregion

#region Clicks

#Find the user when the search button is pressed
$SearchButton.Add_Click({
    $user = Search-ADAccount -AccountDisabled | FT Name
    If($user){
        $OutputTB.Text = $user | Out-String
        }
})

#Display the dialog
$window.ShowDialog()