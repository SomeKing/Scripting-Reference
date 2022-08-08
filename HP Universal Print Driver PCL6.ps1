#Download the Drivers from HP Website and Extract
#Install the Printer Driver name HP Universal Printing PCL 6
$ProgressPreference = 'SilentlyContinue'

New-Item -Path "C:\HP Universal" -ItemType Directory
Invoke-WebRequest -Uri "https://ftp.hp.com/pub/softlib/software13/COL40842/ds-99374-24/upd-pcl6-x64-7.0.1.24923.exe" -OutFile "C:\HP Universal\Drivers.zip"
Expand-Archive -Path "C:\HP Universal\Drivers.zip" -DestinationPath "C:\HP Universal"

pnputil -a "C:\HP Universal\hpcu255u.inf"
Add-PrinterDriver -Name "HP Universal Printing PCL 6"
Remove-Item -Path "C:\HP Universal" -Recurse -Force