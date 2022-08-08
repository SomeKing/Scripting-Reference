#Installs the Kyocera TASKalfa 7002i Driver
#Currently HFCS is the only one with this Printer Type
$ProgressPreference = 'SilentlyContinue'

New-Item -Path "C:\Kyocera" -ItemType Directory
Invoke-WebRequest -Uri "https://cdn.kyostatics.net/dlc/eu/driver/all/kx702415_upd_signed.-downloadcenteritem-Single-File.downloadcenteritem.tmp/KX_Universal_Pr...nter_Driver.zip" -OutFile "C:\Kyocera\Drivers.zip"
Expand-Archive -Path "C:\Kyocera\Drivers.zip" -DestinationPath "C:\Kyocera"

pnputil -a "C:\Kyocera\Kx_8.1.1109_UPD_Signed_EU\en\64bit\OEMSETUP.INF"
Add-PrinterDriver -Name "Kyocera TASKalfa 7002i KX"
Remove-Item -Path "C:\Kyocera\" -Recurse -Force