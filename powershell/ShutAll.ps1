# Import the necessary assemblies
Add-Type -AssemblyName System.Net.NetworkInformation

# Define the IP range
$ipRange = "192.168.0."

# Loop through each IP in the range
for ($i = 1; $i -le 254; $i++) {
    $ip = $ipRange + $i
    Write-Host "Sending shutdown to $ip"
    # Use the shutdown command to send a shutdown signal to the IP
    shutdown /m \\$ip /s /f /t 0
}