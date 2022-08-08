#Installs OFfice 365 Apps for Business
#TODO Implement Selectiion for Business or Enterprise version of Install
$ProgressPreference = 'SilentlyContinue'
Write-Host "Installing Office 365 Apps for Business..."

New-Item -ItemType Directory -Path "C:\Office\"
Invoke-WebRequest -URI "https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_14729-20228.exe" -OutFile "C:\Office\installer.exe"
Start-Process "C:\Office\installer.exe" -ArgumentList "/extract:C:\Office\Out\ /quiet" -Wait
Set-Content -Path "C:\Office\Out\configuration.xml" -Value '<Configuration ID="8c594e62-8bfb-4422-98b3-7d7bc43b347e">
<Add OfficeClientEdition="64" Channel="Current" MigrateArch="TRUE">
  <Product ID="O365BusinessRetail">
    <Language ID="en-us" />
    <ExcludeApp ID="Groove" />
    <ExcludeApp ID="Lync" />
  </Product>
</Add>
<Updates Enabled="TRUE" />
<RemoveMSI />
<Remove ALL="TRUE" />
<Display Level="None" AcceptEULA="TRUE" />
</Configuration>'

Start-Process "C:\Office\Out\setup.exe" -ArgumentList "/configure C:\Office\Out\configuration.xml" -Wait
Remove-Item -Path "C:\Office\" -Force -Recurse