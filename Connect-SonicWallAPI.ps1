$Credential = Get-Credential 
$FirewallAddress = Read-Host -Prompt "Firewall IP including Port if different than 443:"

$CredPair =  "$($Credential.UserName):$($Credential.GetNetworkCredential().Password)"
$EncodedCredPair = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($CredPair))
Remove-Variable -Name CredPair
$Headers = @{
    Authorization = "Basic $EncodedCredPair"
    "override" = $True
}

$loginUri = "https://" + $FirewallAddress + "/api/sonicos/auth"
$configureUri = "https://" + $FirewallAddress + "/api/sonicos/config-mode"
$confirmChangesUri = "https://" + $FirewallAddress + "/api/sonicos/config/pending"

$loginReponse = Invoke-RestMethod -Uri $loginUri -Method Post -SkipCertificateCheck -Headers $Headers


if("User login in non-configuration mode." -eq $loginReponse.status.info.message){
    $configReponse = Invoke-RestMethod -Uri $configureUri -Method Post -SkipCertificateCheck
    $configReponse.status.info
}
###PUT POST/GET Commands here


$ConfirmChanges = Invoke-RestMethod -Method Post -Uri $confirmChangesUri -SkipCertificateCheck
$ConfirmChanges.status