#Decrypt Unlocked C:\ Volume and will wait until fully Decrypted to end script

Get-BitLockerVolume | Disable-BitLocker

While((Get-BitLockerVolume -MountPoint "C:\" | Select-Object -ExpandProperty VolumeStatus) -eq "DecryptionInProgress") {
    Start-Sleep 300
    if((Get-BitLockerVolume -MountPoint "C:\" | Select-Object -ExpandProperty VolumeStatus) -eq "FullyDecrypted"){
        Write-Host("Fully Decrypted")
    }
}   