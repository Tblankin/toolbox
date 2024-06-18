$counter = 1
$countermax = 10
while ($counter -lt $countermax){
   # veeretab 10 korda suvalised kaks kordinaati su ekraanil ning viib su hiire sinna, teeb seda 10 korda, iga kord lisades +1 $counterile kuni counteri vaartus on sama mis $countermax
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point -ArgumentList (Get-Random -Minimum 0 -Maximum 1920), (Get-Random -Minimum 0 -Maximum 1080)
    Start-Sleep -Milliseconds 100
    $counter++

}


