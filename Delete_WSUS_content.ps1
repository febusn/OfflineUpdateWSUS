## Clear WSUS content ##
Write-Host "Clear WSUS content" -ForegroundColor Green

## Replace "WSUS_ServerName" with your actual WSUS server name !!
## Replace path "E:\WSUS\WsusContent" with your actual WSUS contents folder !!

$wsusserver = "WSUS_ServerName"
[void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer()

## Delete WSUS_Content all ## Ready
$input = "null"
$input = Read-Host "Continue with Delete WSUS_Content? anwser y for Yes or n for No"
if ($input -eq 'y'){
    #Stop Services
    Write-Host "Info: Stopping Background Intelligent Transfer Service" -ForegroundColor Yellow
    Get-Service -DisplayName "Background Intelligent Transfer Service" | Stop-Service -Force
    Write-Host "Info: Stopping Windows Update Service" -ForegroundColor Yellow
    Get-Service -DisplayName "Windows Update" | Stop-Service -Force    
    #Close WSUS GUI:
    Write-Host "Info: Close WSUS GUI" -ForegroundColor Yellow
    Get-Process -Name "mmc" | Stop-Process -Force | Out-Null
    #Delete WSUSContent
    Remove-Item -Path E:\WSUS\WsusContent\* -Force -Recurse
    $dirinf = Get-ChildItem E:\WSUS\WsusContent
    If($dirinf.count -ne 0){
        Write-host "Error: Dir is not Empty, check manually" -ForegroundColor Red
        }
    # Recomended to check folder is empty "E:\WSUS\WsusContent"
    Write-Host "Info: Recomended to check folder is empty: E:\WSUS\WsusContent" -ForegroundColor Yellow
    pause
    ##Start Services
    Write-Host "Info: Starting Background Intelligent Transfer Service" -ForegroundColor Yellow
    Get-Service -DisplayName "Background Intelligent Transfer Service" | Start-Service
    Write-Host "Info: Starting Windows Update Service" -ForegroundColor Yellow
    Get-Service -DisplayName "Windows Update" | Start-Service
    }