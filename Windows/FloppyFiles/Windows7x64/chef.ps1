if (-not(Test-Path )) {
	(New-Object System.Net.WebClient).DownloadFile('http://www.getchef.com/chef/install.msi', 'C:\Windows\Temp\chef.msi')
}

&msiexec.exe /i /qb! C:\Windows\Temp\chef.msi REBOOT=ReallySupress ALLUSERS=1

Start-Sleep 1