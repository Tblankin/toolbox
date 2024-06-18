#Kustuta temp failid windows kaustast
$windowsTempPath = [Environment]::GetEnvironmentVariable("windir") + "\Temp"
if (Test-Path $windowsTempPath) {
    Get-ChildItem $windowsTempPath -Recurse -File -Force | Where-Object { !$_.PSIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-7) } | Remove-Item -Force
}

#Kustuta temp failid kasutaja kaustast
$userTempPath = [Environment]::GetEnvironmentVariable("temp")
if (Test-Path $userTempPath) {
    Get-ChildItem $userTempPath -Recurse -File -Force | Where-Object { !$_.PSIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-7) } | Remove-Item -Force
}