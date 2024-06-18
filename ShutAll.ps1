Add-Type -AssemblyName System.Net.NetworkInformation

# annab ip raadiuse
$ipRange = "192.168.0."

# iga number mis on vahemikus 1-254, saadab sellele shutdown commandi
for ($i = 1; $i -le 254; $i++) {
    $ip = $ipRange + $i
    Write-Host "Sending shutdown to $ip"
    shutdown /m \\$ip /s /f /t 0
}
