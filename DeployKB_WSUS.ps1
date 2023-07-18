 Write-Output "WSUS deploy is starting"
 Write-Output "The actual update .msu for this scenario should be locatedon c:\tmp, otherwise change the path on the ImportUpdateFromCatalogSite"
 $kb_ID = read-Host -prompt "Give update KB ID eg: c5aff5d1-1d7e-494f-8214-cd1ad93704b7 "
 $kb_NameMSU = read-Host -prompt "Give KB MSU name: eg: windows10.0-kb5018419-x64_08f6e9eb4e8cb9f7af2b152e6dea624490a60b2d.msu "

 # Install through WSUS the current KB ID.#
 $wsus.ImportUpdateFromCatalogSite($kb_ID, "c:\tmp\$kb_NameMSU") 
 pause