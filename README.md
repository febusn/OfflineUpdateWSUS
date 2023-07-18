# OfflineUpdateWSUS
Procedure for Offline deploy WSUS Updates

Description:

It is a necessity, to provide regularly Microsoft update packages, on Windows servers. When updates are to be installed in many machines WSUS servers are 
the best available MS tool. It is often needed for Windows server systems to both stay isolated behind firewalls without any interaction with outside world, 
but simultaneously stay updated especially with Microsoft security updates, KBs, through an offline WSUS server.  
 
The current document briefly describes a method for updating Windows server systems, through an internal WSUS, in an offline way. In this case we will focus 
on a procedure for building such an Update package (it can contain any KBs) on a WSUS server connected to internet, and then the procedure, when transfer to 
isolated system, to install this package on the Internal WSUS server.

Some overcome difficulties, especially regarding the size of the package, will be explained and improvements will be quoted along with limitations. Automated 
PowerShell scripts will be provided.

Basic understanding of Microsoft’s WSUS system is needed.

Inside "Offline_WSUS_update_Procedure.docx" there are all the steps for this procedure and scripts which automate each individual step.
A full automated framework (Based on this procedure) for creating Update WSUS Packages is available on Git repo: AutoBuild_WSUS_UpdatePkg 
