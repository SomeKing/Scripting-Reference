#Will uninstall any package starting with Adobe Acrobat
$ProgressPreference = 'SilentlyContinue'
Install-PackageProvider Nuget -Force

$UninstallStatus = Get-Package "Adobe Acrobat*" | Uninstall-Package -Force 

if($null -eq $UninstallStatus){
    Write-Host "Package Failed to uninstall or Adobe Product not found"
}
else{Restart-Computer}