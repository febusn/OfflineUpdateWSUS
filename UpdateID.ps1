# Get KB ID from KB title #

 $kb_Title = read-Host -prompt "Give KB Title eg: 2022-10 Cumulative Update for Windows Server 2019 for x64-based Systems (KB5018419) "
 $KB_UpCat = Invoke-WebRequest -Uri "https://www.catalog.update.microsoft.com/Search.aspx?q=$kb_Title"
 Write-Output " KB_Title ; KB_ID " 
 $KB_UpCat.Links | where onClick -Like "goToDetails*" | foreach {$_.innerText + ";" + " " + $_.id -replace '_Link','' }

