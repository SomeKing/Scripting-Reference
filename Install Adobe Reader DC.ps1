#Installs the Free Adobe Reader version of Acrobat x64 bit
$ProgressPreference = 'SilentlyContinue'
Write-Host "Installing Adobe Reader..."

New-Item -ItemType Directory -Path "C:\Adobe\"
Invoke-WebRequest -URI "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2200120117/AcroRdrDC2200120117_en_US.exe" -OutFile "C:\Adobe\Installer.exe"
Start-Process "C:\Adobe\Installer.exe" -ArgumentList "/sAll /rs /rps" -Wait
Remove-Item -Path "C:\Adobe\" -Force -Recurse