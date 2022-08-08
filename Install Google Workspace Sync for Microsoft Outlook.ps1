#Installs GWSO For Gmails to Outlook without IMAP
$ProgressPreference = 'SilentlyContinue'
New-Item -ItemType Directory -Path 'C:\GSWO'

Invoke-WebRequest -URI "https://dl.google.com/dl/google-apps-sync/x64/enterprise_gsync.msi" -OutFile 'C:\GSWO\installer.msi'
Start-Process msiexec.exe -ArgumentList "/i C:\GSWO\installer.msi /qn" -Wait
Remove-Item C:\GSWO -Force -Recurse