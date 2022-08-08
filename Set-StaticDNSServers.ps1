param {
    [string]$DNSSuffix,
    [string[]]$ServerAddreses
}

$AdapaterInfo = Get-NetConnectionProfile | Where-Object Name -eq $DNSSuffix
$Adapter = Get-NetIPAddress -InterfaceIndex $AdapaterInfo.InterfaceIndex | Where-Object AddressFamily -eq IPv4

If ($Adapter.PrefixOrigin -eq "Manual"){
    Set-DnsClientServerAddress -InterfaceIndex $Adapter.InterfaceIndex -ServerAddresses $ServerAddreses
    return $ServerAddreses
}