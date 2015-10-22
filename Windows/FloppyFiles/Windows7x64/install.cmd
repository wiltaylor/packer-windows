@echo off
echo Installing VMWare Tools
start /wait cmd.exe /c a:\vmware.cmd
echo Running Misc script
start /wait powershell.exe -executionpolicy bypass -noprofile -noninteractive -file a:\misc.ps1
echo Running chef installer
start /wait powershell.exe -executionpolicy bypass -noprofile -noninteractive -file a:\chef.ps1
echo Running wintm config
start /wait powershell.exe -executionpolicy bypass -noprofile -noninteractive -file a:\Enablewinrm.ps1
shutdown -r -f -t 0
