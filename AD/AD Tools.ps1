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
      
        <Button x:Name = "AttributeButton"
            Content = "Attribute Changer"
            Width = "150"
            Grid.Column = "1"
            Grid.Row = "4"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "UnlockButton"
            Content = "Unlock AD Account"
            Width = "150"
            Grid.Column = "1"
            Grid.Row = "6"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "EnableButton"
            Content = "Enable AD Account"
            Width = "150"
            Grid.Column = "1"
            Grid.Row = "8"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "DisableButton"
            Content = "Disable AD Account"
            Width = "150"
            Grid.Column = "1"
            Grid.Row = "10"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "TBD3Button"
            Content = "TBD"
            Width = "150"
            Grid.Column = "3"
            Grid.Row = "4"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "TBD4Button"
            Content = "TBD"
            Width = "150"
            Grid.Column = "3"
            Grid.Row = "6"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "TBD5Button"
            Content = "TBD"
            Width = "150"
            Grid.Column = "3"
            Grid.Row = "8"
            Foreground = "#FFFFFF"
            Background = "#00a151"
        />
        <Button x:Name = "TBD6Button"
            Content = "TBD"
            Width = "150"
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
$AttributeButton = $window.FindName("AttributeButton")
$UnlockButton = $window.FindName("UnlockButton")
$EnableButton = $window.FindName("EnableButton")
$DisableButton = $window.FindName("DisableButton")

#Button Section
$AttributeButton.Add_Click({
        $window.Close()
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/User/AD%20-%20Attribute%20Changer.ps1").Content
})

$UnlockButton.Add_Click({
        $window.Close()
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/User/AD%20-%20Unlock%20AD%20User.ps1").Content
})

$EnableButton.Add_Click({
        $window.Close()
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/User/AD%20-%20Enable%20AD%20User.ps1").Content
})

$DisableButton.Add_Click({
        $window.Close()
     Invoke-expression (invoke-webrequest -uri "https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/AD/User/AD%20-%20Disable%20AD%20User.ps1").Content
})

$window.ShowDialog()