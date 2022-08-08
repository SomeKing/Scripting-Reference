$applicationPoolsPath = "/system.applicationHost/applicationPools"
$applicationPools = Get-WebConfiguration $applicationPoolsPath

foreach ($appPool in $applicationPools.Collection){
    $appPool.Name
    $appPoolPath = "$applicationPoolsPath/add[@name='$($appPool.Name)']"
    Get-WebConfiguration "$appPoolPath/recycling/periodicRestart/@privateMemory"
    Set-WebConfiguration "$appPoolPath/recycling/periodicRestart/@privateMemory" -Value 1000
}