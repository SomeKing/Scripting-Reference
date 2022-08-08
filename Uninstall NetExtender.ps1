#Will uninstall Sonicwall NetExtender any version 
$ProgressPreference = 'SilentlyContinue'
Install-PackageProvider Nuget -Force

$UninstallStatus = Get-Package "SonicWall NetExtender" | Uninstall-Package -Force 

if($null -eq $UninstallStatus){
    Write-Host "Package Failed to uninstall or NetExtender not found"
}
else{Restart-Computer}