Get-ScheduledTask -TaskName RemoveTempUser | Unregister-ScheduledTask -Confirm:$false
$ScriptToRun = "Remove-LocalUser Temp; Get-ScheduledTask -TaskName RemoveTempUser | Unregister-ScheduledTask -Confirm:$false"
#Setting up a task scheduled event to delete the temp user

New-Item -ItemType Directory -Path "C:\Scripts"
New-Item -ItemType File -Path "C:\Scripts\DeleteTempUser.ps1"
$ScriptToRun | Out-File -FilePath "C:\Scripts\DeleteTempUser.ps1"

$Trigger = New-ScheduledTaskTrigger -AtStartup
$User = "NT AUTHORITY\SYSTEM"
$Action = New-ScheduledTaskAction -Execute "Powershell" -Argument "-ExecutionPolicy Bypass -File C:\Scripts\DeleteTempUser.ps1"
Register-ScheduledTask -TaskName "RemoveTempUser" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest -Force

Restart-Computer -Force