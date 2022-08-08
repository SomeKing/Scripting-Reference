function Test-LocalLogin {
    param (
        [Parameter(Mandatory)][string]$Username,
        [Parameter(Mandatory)][securestring]$Password
    ) 
    $computer = $env:COMPUTERNAME
    Add-Type -AssemblyName System.DirectoryServices.AccountManagement
    $obj = New-Object System.DirectoryServices.AccountManagement.PrincipalContext('machine',$computer)
    $obj.ValidateCredentials($username, (ConvertFrom-SecureString -SecureString $Password -AsPlainText)) 
}
