#This script is for installing Sophos via the API to automatically install Sophos based on received input or a variable chosen in script
#This uses an API call to Sophos Central using the Powershell Scripting account as readonly 
#Sophos Rate Limites
<#
Rate limits
All our APIs are rate-limited. If you call them too often, you'll get back a response with a 429 (Too Many Requests) status code. The response JSON is an error object. See the next section for advice on dealing with this error.

To avoid getting this error, callers should space out requests using the following schedule:

Time window	Maximum Allowed	Notes
1 second	10 API calls	Recommended
1 minute	100 API calls	Enforced, but bursts up to 300 calls per minute are allowed
1 hour	1000 API calls	Recommended
1 day	200,000 API calls	Enforced
#>
#API Credentials and Variables Required
function Install-SophosAV {
    param (
        [Parameter(Mandatory)][string]$ClientID,
        [Parameter(Mandatory)][string]$ClientSecret,
        [Parameter(Mandatory)][string]$TenantUser,
        [string]$InstallerType = "computer"
    )
    
}

#Creating Download Location
New-Item -ItemType Directory -Path "C:\Sophos\"
$token_Response = Invoke-RestMethod -Method Post -Uri https://id.sophos.com/api/v2/oauth2/token -ContentType "application/x-www-form-urlencoded" -Body "grant_type=client_credentials&client_id=$ClientID&client_secret=$ClientSecret&scope=token"
$whoAmiResp = Invoke-RestMethod -Method Get -Headers @{Authorization="Bearer $($token_Response.access_token)"} -Uri "https://api.central.sophos.com/whoami/v1"
$tenants = Invoke-RestMethod -Method Get -Headers @{Authorization="Bearer $($token_Response.access_token)"; "X-Partner-ID"=$whoAmiResp.id} -Uri https://api.central.sophos.com/partner/v1/tenants?pageTotal=true
ForEach ($user in $tenants.items){if($TenantUser -eq $user.name){$tenantID = $user.id; $tenantDataReg = $user.dataRegion}}
$installerInfo = Invoke-RestMethod -Method Get -Headers @{Authorization="Bearer $($token_Response.access_token)"; "X-Tenant-ID"=$tenantID} -Uri "https://api-$tenantDataReg.central.sophos.com/endpoint/v1/downloads?platforms=windows"
ForEach ($installer in $installerInfo.installers){if ($installerType -eq $installer.type){Invoke-WebRequest -Uri $installer.downloadUrl -OutFile "C:\Sophos\SophosSetup.exe"}}
Start-Process "C:\Sophos\SophosSetup.exe" -ArgumentList "--quiet --nocompetitorremoval" -Wait