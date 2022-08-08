#Installs the Subscription Version of Acrobat Pro DC
#This requires an active Subscription to the software to license
#Only available in x32 bit
$ProgressPreference = 'SilentlyContinue'
Write-Host "Installing Adobe Acrobat Pro DC..."

New-Item -ItemType Directory -Path "C:\Adobe\"
Invoke-WebRequest -URI "https://trials.adobe.com/AdobeProducts/APRO/Acrobat_HelpX/win32/Acrobat_DC_Web_WWMUI.zip" -OutFile "C:\Adobe\AdobeFiles.zip"
Expand-Archive -Path "C:\Adobe\AdobeFiles.zip" -DestinationPath "C:\Adobe\"

Start-Process "C:\Adobe\Adobe Acrobat\Setup.exe" -ArgumentList "/sl '1033' /sall" -Wait
Remove-Item -Path "C:\Adobe\" -Force -Recurse
