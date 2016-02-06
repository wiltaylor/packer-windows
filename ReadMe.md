# Windows Vagrant Boxes
This repository contains a Psake file that will use packer to build vagrant boxes for the following OSes:
* Windows 7x64
* Windows 7x86
* Windows 8x64
* Windows 8x86
* Windows 8.1x64
* Windows 8.1x86
* Windows 10x64
* Windows 10x86
* Windows 2008R2x64
* Windows 2012x64
* Windows 2012 Corex64
* Windows 2012R2x64
* Windows 2012R2 Corex64
* Windows 2016x64
* Windows 2016 Corex64

## Prerequisites 
Before you can run this script you need to have the following prerequisites.

* [Packer](http://www.packer.io)
* [Vagrant](https://www.vagrantup.com/)
* [PowerShell 5](https://www.microsoft.com/en-us/download/details.aspx?id=48729) (This might work on older versions but was only tested on PowerShell 5 on windows 10).
* [PSake PowerShell module](https://github.com/psake/psake)
* [VMWare Workstation](http://www.vmware.com/au/products/workstation)
* [Virtual Box](https://www.virtualbox.org/)

After the above is installed you need one last thing. Which is upgrader.exe from vmware. To get this do the following:

1. Create a new VM and use VMware’s easy install feature to create the vm for you but don’t start the vm.
2. Extract the autoinst.flp file created by vmware with 7zip. Note: You will get an error when extracting. The file is still fine.
3. Create a Tools and an ISO folder inside the Windows directory in this repository.
4. Copy the upgrader.exe file to the Tools folder of this repository created above.
5. Copy your windows install iso files into the ISO folder. Look at the contents of pssake-build.ps1 file for the expected filenames of the iso files.

## Running the build script
Simply run the following command from the Windows directory of the repository.
> Invoke-psake -buildFile .\psake-build.ps1 -taskList BuildAll

Once completed this will create all the boxes in the Windows directory. You can install them all with the following command.
> Invoke-psake -buildFile .\psake-build.ps1 -taskList ImportAll

## Credit
I would like to thank Joe Fitzgerald who created the original Windows packer configurations which helped me build these ones.
[github.com/joefitzgerald/packer-windows](https://github.com/joefitzgerald/packer-windows)
