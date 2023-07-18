##  Approve4Install  ##

## Replace "GroupA" and "GroupB" with your actual Group of servers set on WSUS server !!
## Replace "GroupA.txt" and "GroupB.txt" with the files containing the KBs for each group of servers !!

[void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")	
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer()			# WSUS assigned
$GroupA = $wsus.GetComputerTargetGroups() | ? {$_.Name -like 'GroupA'}      # Needed Groups
$GroupB = $wsus.GetComputerTargetGroups() | ? {$_.Name -like 'GroupB'}      # Needed Groups

##GroupA servers###
Write-Host "###GroupA Computers Target group###" -ForegroundColor Cyan
Write-Host "Searching and approving updates..." -ForegroundColor DarkCyan
foreach($KB in Get-Content .\GroupA.txt) {
    $update=$wsus.SearchUpdates($KB)
    if(!$update){
        Write-Host "!! $KB for GroupA Computers not found !!" -ForegroundColor Red
        Write-Host "!! Search on WSUS and Approve manually !!" -ForegroundColor Red
    }
    else {
         $update.Approve("Install",$GroupA)
         Write-Host "!! $KB Approved for GroupA Computers !!" -ForegroundColor Green       
    }
}

###GroupB servers###
Write-Host "###GroupB Computers Target group###" -ForegroundColor Cyan
Write-Host "Searching and approving updates..." -ForegroundColor DarkCyan
foreach($KB in Get-Content .\GroupB.txt) {
    $update=$wsus.SearchUpdates($KB)
    if(!$update){
        Write-Host "!! $KB for GroupB Computers not found !!" -ForegroundColor Red
        Write-Host "!! Search on WSUS and Approve manually !!" -ForegroundColor Red
    }
    else {
         $update.Approve("Install",$GroupB)
         Write-Host "!! $KB Approved for GroupB Computers !!" -ForegroundColor Green
    }
}