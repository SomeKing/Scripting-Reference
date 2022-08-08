#Installs Chrome Enterprise version which just enables support for Google Workspaces better Integration
$ProgressPreference = 'SilentlyContinue'

Write-Host "Installing Chrome..."
New-Item -ItemType Directory -Path "C:\Google\"
Invoke-WebRequest -URI "https://dl.google.com/chrome/install/GoogleChromeStandaloneEnterprise64.msi" -OutFile "C:\Google\Installer.msi"
Start-Process msiexec.exe -ArgumentList "/i C:\Google\Installer.msi /qn" -Wait
Remove-Item -Path "C:\Google\" -Force -Recurse