Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# baas
$vorm = New-Object System.Windows.Forms.Form
$vorm.Text = "PaksPoiss1.7"
$vorm.Size = New-Object System.Drawing.Size(800,600)
$vorm.StartPosition = "CenterScreen"
$vorm.BackColor = [System.Drawing.Color]::white

# vahelehed
$vahelehekontroll = New-Object System.Windows.Forms.TabControl
$vahelehekontroll.Location = New-Object System.Drawing.Point(10,10)
$vahelehekontroll.Size = New-Object System.Drawing.Size(780,550)
$vahelehekontroll.TabIndex = 0
$vahelehekontroll.BackColor = [System.Drawing.Color]::white
$vaheleht1 = New-Object System.Windows.Forms.TabPage
$vaheleht1.Text = "Main"
$vaheleht1.BackColor = [System.Drawing.Color]::white
$vaheleht2 = New-Object System.Windows.Forms.TabPage
$vaheleht2.Text = "CLI"
$vaheleht2.BackColor = [System.Drawing.Color]::white

$vahelehekontroll.TabPages.Add($vaheleht1)
$vahelehekontroll.TabPages.Add($vaheleht2)


#vaheleht1


# lubab hyperv (Pro Edition ainult)
$nupp1 = New-Object System.Windows.Forms.Button
$nupp1.Location = New-Object System.Drawing.Point(10,10)
$nupp1.Size = New-Object System.Drawing.Size(100,23)
$nupp1.Text = "Enable WSL"
$nupp1.Add_Click({ .\WSL.ps1})

#Naitab kaivad protsesse ning neid saab sulgeda
$nupp2 = New-Object System.Windows.Forms.Button
$nupp2.Location = New-Object System.Drawing.Point(10, 40)
$nupp2.Size = New-Object System.Drawing.Size(100,23)
$nupp2.Text = "Delete Temp"
$nupp2.Add_Click({ .\TempDel.ps1})
#testib kolareid/muud heli seadet mis on valitud peamiseks
$nupp3 = New-Object System.Windows.Forms.Button
$nupp3.Location = New-Object System.Drawing.Point(10, 70)
$nupp3.Size = New-Object System.Drawing.Size(100,23)
$nupp3.Text = "Audio Test"
$nupp3.Add_Click({ .\AudioTest.ps1 })
#Eemaldab saasta
$nupp4 = New-Object System.Windows.Forms.Button
$nupp4.Location = New-Object System.Drawing.Point(10, 100)
$nupp4.Size = New-Object System.Drawing.Size(100,23)
$nupp4.Text = "Remove Bloat"
$nupp4.Add_Click({ .\Bloat.ps1 })

#Vahetab arvuti nime
$nupp5 = New-Object System.Windows.Forms.Button
$nupp5.Location = New-Object System.Drawing.Point(10, 130)
$nupp5.Size = New-Object System.Drawing.Size(100,23)
$nupp5.Text = "PC Name"
$nupp5.Add_Click({ .\ChangePCName.ps1 })
#Teeb tuhja VMi
$nupp6 = New-Object System.Windows.Forms.Button
$nupp6.Location = New-Object System.Drawing.Point(10,170)
$nupp6.Size = New-Object System.Drawing.Size(100,23)
$nupp6.Text = "HyperV Enabler"
$nupp6.Add_Click({ .\HyperV.ps1})
#Saad staatilise ip panna
$nupp7 = New-Object System.Windows.Forms.Button
$nupp7.Location = New-Object System.Drawing.Point(10, 200)
$nupp7.Size = New-Object System.Drawing.Size(100,23)
$nupp7.Text = "HiirePauk"
$nupp7.Add_Click({ .\MouseBust.ps1 })
#Pingib 8.8.8.8
$nupp8 = New-Object System.Windows.Forms.Button
$nupp8.Location = New-Object System.Drawing.Point(10, 230)
$nupp8.Size = New-Object System.Drawing.Size(100,23)
$nupp8.Text = "Liitmine"
$nupp8.Add_Click({ .\Liitmine.ps1 })
#Keelab cortana
$nupp9 = New-Object System.Windows.Forms.Button
$nupp9.Location = New-Object System.Drawing.Point(10, 260)
$nupp9.Size = New-Object System.Drawing.Size(100,23)
$nupp9.Text = "Kiisufakt"
$nupp9.Add_Click({ .\kiisufakt.ps1 })
#IP jargi asukoha leidmine
$nupp10 = New-Object System.Windows.Forms.Button
$nupp10.Location = New-Object System.Drawing.Point(10, 290)
$nupp10.Size = New-Object System.Drawing.Size(100,23)
$nupp10.Text = "Shut All"
$nupp10.Add_Click({ .\ShutAll.ps1 })

#Rippmenuu
$rippmenuu = New-Object System.Windows.Forms.ComboBox
$rippmenuu.Location = New-Object System.Drawing.Point(500,450)
$rippmenuu.Size = New-Object System.Drawing.Size(150,20)


$silt = New-Object System.Windows.Forms.Label
$silt.Location = New-Object System.Drawing.Point(500,420)
$silt.Size = New-Object System.Drawing.Size(150,20)
$silt.Text = "Vali:"



# Valikud kasti jaoks
$rippmenuu.Items.Add("Shut Down")
$rippmenuu.Items.Add("Restart")
$rippmenuu.Items.Add("Lock")
$rippmenuu.Items.Add("Log Off")
$rippmenuu.Items.Add("Hibernate")
$rippmenuu.Items.Add("Sleep")

#esitab esimest asja rippmenuus algvalikuna
$rippmenuu.SelectedIndex = 0

# teeb seda soltuvalt mis sa valisid
$rippmenuu.Add_SelectedIndexChanged({
    $selectedItem = $rippmenuu.SelectedItem
    switch ($selectedItem) {
        "Shut Down" { Stop-Computer -Force }
        "Restart" { Restart-Computer -Force }
        "Lock" { rundll32.exe user32.dll,LockWorkStation }
        "Log Off" { Exit-PSSession }
        "Hibernate" { Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Application]::SetSuspendState($true, $false, $false) }
        "Sleep" { Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Application]::SetSuspendState($false, $false, $false) }
    }
})


#lihtsalt silt kus on minu nimi
$silt2 = New-Object System.Windows.Forms.Label
$silt2.Location = New-Object System.Drawing.Point(10,500)
$silt2.Size = New-Object System.Drawing.Size(800,800)
$silt2.Font = [System.Drawing.Font]::new("Comic Sans", 12, [System.Drawing.FontStyle]::Bold)
$silt2.Text = "T        H        O        M        A        S        B        L        A        N        K        I        N        I        T        2        2"

#lisab asjad vormi
$vaheleht1.Controls.Add($rippmenuu)
$vaheleht1.Controls.Add($silt)
$vaheleht1.Controls.Add($silt2)
$vaheleht1.Controls.Add($scriptTextBox)
$vaheleht1.Controls.Add($nupp1)
$vaheleht1.Controls.Add($nupp2)
$vaheleht1.Controls.Add($nupp3)
$vaheleht1.Controls.Add($nupp4)
$vaheleht1.Controls.Add($nupp5)
$vaheleht1.Controls.Add($nupp6)
$vaheleht1.Controls.Add($nupp7)
$vaheleht1.Controls.Add($nupp8)
$vaheleht1.Controls.Add($nupp9)
$vaheleht1.Controls.Add($nupp10)


# TAB2

# Tekstikasti sisu näitamine
$tekstikast = New-Object System.Windows.Forms.TextBox
$tekstikast.Location = New-Object System.Drawing.Point(10,10)
$tekstikast.Size = New-Object System.Drawing.Size(200,20)

$tekstivaljund = New-Object System.Windows.Forms.Label
$tekstivaljund.Location = New-Object System.Drawing.Point(10,40)
$tekstivaljund.Size = New-Object System.Drawing.Size(200,20)

$vaheleht2.Controls.Add($tekstikast)
$vaheleht2.Controls.Add($tekstivaljund)

$tekstikast.Add_TextChanged({
    $tekstivaljund.Text = $tekstikast.Text
})




# kast
$ristkast1 = New-Object System.Windows.Forms.CheckBox
$ristkast1.Location = New-Object System.Drawing.Point(150,10)
$ristkast1.Size = New-Object System.Drawing.Size(100,20)
$ristkast1.Text = "Pime versioon"
# Saa registrist kas darkmode on peal
$pimedus = (Get-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -ErrorAction SilentlyContinue).AppsUseLightTheme -eq 0
# kontrollib kas see on peal
$ristkast1.Checked = !$pimedus

# vahetab kas darkmode on sees valjas soltuvalt mis olekus checkbox on
$ristkast1.Add_CheckedChanged({
    if ($ristkast1.Checked) {
        # Lulitab sisse
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -Type DWORD -Force
    } else {
        # lulitab valja
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 1 -Type DWORD -Force
    }
})
$vaheleht1.Controls.Add($ristkast1)
# Keelab arvutil tuttu minna
$ristkast2 = New-Object System.Windows.Forms.CheckBox
$ristkast2.Location = New-Object System.Drawing.Point(150,40)
$ristkast2.Size = New-Object System.Drawing.Size(100,20)
$ristkast2.Text = "Ei Maga"

# votab registrist staatuse
$voolusatted = Get-ItemProperty -Path "HKCU:\System\Power" -Name "HibernateEnabled" -ErrorAction SilentlyContinue

# muudab kasti olekut soltuvalt mis valitud on eelnevalt
if ($voolusatted.HibernateEnabled -eq 0) {
    $ristkast2.Checked = $true
} else {
    $ristkast2.Checked = $false
}

# muudab kas arvuti tutub v ei
$ristkast2.Add_CheckedChanged({
    if ($ristkast2.Checked) {
        # keelab
        powercfg /h off
    } else {
        # lubab
        powercfg /h on
    }
})



$vaheleht1.Controls.Add($ristkast2)

#Keelab telemeetria
$ristkast3 = New-Object System.Windows.Forms.CheckBox
$ristkast3.Location = New-Object System.Drawing.Point(150,70)
$ristkast3.Size = New-Object System.Drawing.Size(100,20)
$ristkast3.Text = "Telemeetria"

$ristkast3.Add_CheckStateChanged({
    #kontrollib mis olekus checkbox on, ning sellejargi otsustab mida teha
    if ($ristkast3.Checked) {
        Write-Host "Telemetria lubatud"
        & ".\EnableTelemetry.ps1"
    } else {
        Write-Host "Telemetry keelatud"
        & ".\DisableTelemetry.ps1"
    }
})

$vaheleht1.Controls.Add($ristkast3)



Add-Type -AssemblyName System.Windows.Forms

# Create a warning form
$hoiatusvorm = New-Object System.Windows.Forms.Form
$hoiatusvorm.Text = "Hoiatus"
$hoiatusvorm.Size = New-Object System.Drawing.Size(450,175)
$hoiatusvorm.StartPosition = "CenterScreen"

$hoiatussilt = New-Object System.Windows.Forms.Label
$hoiatussilt.Text = "See programm voib olla kahjulik su vaimsele tervisele ning tekitada epilepsiahoogu"
$hoiatussilt.AutoSize = $true
$hoiatussilt.Location = New-Object System.Drawing.Point(10,20)
$hoiatusvorm.Controls.Add($hoiatussilt)

$okButton = New-Object System.Windows.Forms.Button
$okButton.Text = "OK"
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$okButton.Location = New-Object System.Drawing.Point(150,50)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$hoiatusvorm.AcceptButton = $okButton
$hoiatusvorm.Controls.Add($okButton)

$tuhistanupp = New-Object System.Windows.Forms.Button
$tuhistanupp.Text = "Ei soovi"
$tuhistanupp.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$tuhistanupp.Location = New-Object System.Drawing.Point(225,50)
$tuhistanupp.Size = New-Object System.Drawing.Size(75,23)
$hoiatusvorm.CancelButton = $tuhistanupp
$hoiatusvorm.Controls.Add($tuhistanupp)

# Show the warning form
$tulemus = $hoiatusvorm.ShowDialog()

if ($tulemus -eq [System.Windows.Forms.DialogResult]::OK) {
    # Create the checkbox and timer
    $ristkast4 = New-Object System.Windows.Forms.CheckBox
    $ristkast4.Location = New-Object System.Drawing.Point(150,100)
    $ristkast4.Size = New-Object System.Drawing.Size(100,20)
    $ristkast4.Text = "Vikerkaar"

    $timer = New-Object System.Windows.Forms.Timer
    $timer.Interval = 10 # 10 = 0.01s
    $timer.Add_Tick({
        if ($ristkast4.Checked) {
            $vorm.BackColor = [System.Drawing.Color]::FromArgb((Get-Random -Minimum 0 -Maximum 256), (Get-Random -Minimum 0 -Maximum 256), (Get-Random -Minimum 0 -Maximum 256))
            $vaheleht1.BackColor = [System.Drawing.Color]::FromArgb((Get-Random -Minimum 0 -Maximum 256), (Get-Random -Minimum 0 -Maximum 256), (Get-Random -Minimum 0 -Maximum 256))
        } else {
            $vorm.BackColor = [System.Drawing.Color]::White
            $vaheleht1.BackColor = [System.Drawing.Color]::White
        }
    })
    $timer.Start()

    $vaheleht1.Controls.Add($ristkast4)
} else {
    Write-Host "Operation cancelled."
}


$ristkast5 = New-Object System.Windows.Forms.CheckBox
$ristkast5.Location = New-Object System.Drawing.Point(150,130)
$ristkast5.Size = New-Object System.Drawing.Size(100,20)
$ristkast5.Text = "Estonia time B)" #muudab aja eesti ajatsooniks
$ristkast5.Add_CheckStateChanged({
    if ($ristkast5.Checked) {
        Set-TimeZone -Id "EET"
    } else {
        Set-TimeZone -Id "EET"
    }
   $vorm.Refresh()
})


$vaheleht1.Controls.Add($ristkast5)

$vaheleht2.Controls.Add($cliInfoTextBox)






$vorm.Controls.Add($vahelehekontroll)


$vorm.Add_Shown({$vorm.Activate()})
$vorm.ShowDialog()
