if (-not(Test-Path "C:\Windows\Temp\chef.msi")) {
	(New-Object System.Net.WebClient).DownloadFile('http://www.getchef.com/chef/install.msi', 'C:\Windows\Temp\chef.msi')
}

&msiexec.exe /i C:\Windows\Temp\chef.msi /qb! REBOOT=ReallySupress ALLUSERS=1

Start-Sleep 1