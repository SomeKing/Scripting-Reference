#Installs Konica Minolta Universal Driver
#From Konica Website KONICA MINOLTA UNIVERSAL PCL
$ProgressPreference = 'SilentlyContinue'

New-Item -Path "C:\Kyocera" -ItemType Directory
Invoke-WebRequest -Uri "https://cscsupportftp.mykonicaminolta.com/DownloadFile/Download.ashx?fileversionid=33677&productid=2176" -OutFile "C:\Kyocera\Drivers.zip"
Expand-Archive -Path "C:\Kyocera\Drivers.zip" -DestinationPath "C:\Kyocera"

pnputil -a "C:\Kyocera\KM_UniversalDriver_PS_PCL_FAX_3.9.117.0\PCL\Driver\Win_x64\\KOAX8J__.inf"
Add-PrinterDriver -Name "KONICA MINOLTA Universal PCL"
Remove-Item -Path "C:\Kyocera" -Recurse -Force