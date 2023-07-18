## Decline all ##
Write-Host "Decline all" -ForegroundColor Green

## Replace "WSUS_ServerName" with your actual WSUS server name !!

$wsusserver = "WSUS_ServerName"
[void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer()

$input = Read-Host "Continue with decline all? anwser y for Yes or n for No"
if ($input -eq 'y'){
    Write-Host "Decline updates started" + (Get-date).DateTime 
    Get-WsusUpdate -Classification All -Approval AnyExceptDeclined -Status Any | Deny-WsusUpdate
    Write-Host "Decline updates finished" + (Get-date).DateTime 
    }


