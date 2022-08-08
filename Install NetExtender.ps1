#Installs the specific version of NetExtender from website
#Will need to be updated whenever a new version is released
$ProgressPreference = 'SilentlyContinue'
New-Item -ItemType Directory -Path 'C:\NetExtender'

Invoke-WebRequest -URI "https://software.sonicwall.com/NetExtender/NetExtender-x64-10.2.324.MSI" -OutFile 'C:\NetExtender\Installer.msi'
Start-Process msiexec.exe -ArgumentList "/i C:\NetExtender\Installer.msi /qn" -Wait
Remove-Item C:\NetExtender -Force -Recurse

Restart-Computer