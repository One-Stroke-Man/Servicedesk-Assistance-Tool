Add-Type -AssemblyName PresentationFramework

#region XAML
[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window"
    Title="Servicedesk Assistance Tool"
    Background = "#1A1246"
    SizeToContent="WidthAndHeight" >

    <Grid x:Name="Grid">
        <Grid.RowDefinitions>
            <RowDefinition Height="23"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="23"/>
            <RowDefinition Height="25"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="25"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="25"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="25"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="25"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="25"/>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="50"/>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition Width="20"/>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition Width="50"/>
        </Grid.ColumnDefinitions>
      
        <Button x:Name = "LoginButton"
            Content = "Login Exchange"
            Width = "100"
            Grid.Column = "1"
            Grid.Row = "4"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "SharedButton"
            Content = "Regular -> Shared"
            Width = "100"
            Grid.Column = "1"
            Grid.Row = "6"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "RegularButton"
            Content = "Shared -> Regular"
            Width = "100"
            Grid.Column = "1"
            Grid.Row = "8"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "TBD2Button"
            Content = "TBD"
            Width = "100"
            Grid.Column = "1"
            Grid.Row = "10"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "TBD3Button"
            Content = "TBD"
            Width = "100"
            Grid.Column = "3"
            Grid.Row = "4"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "TBD4Button"
            Content = "TBD"
            Width = "100"
            Grid.Column = "3"
            Grid.Row = "6"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "TBD5Button"
            Content = "TBD"
            Width = "100"
            Grid.Column = "3"
            Grid.Row = "8"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "TBD6Button"
            Content = "TBD"
            Width = "100"
            Grid.Column = "3"
            Grid.Row = "10"
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


$window.ShowDialog()