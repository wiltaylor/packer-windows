@echo off
cd %temp%
powershell.exe -executionpolicy bypass -file fixnetwork.ps1
winrm quickconfig -q 
winrm set winrm/config/winrs @{MaxMemoryPerShellMB="512"} 
winrm set winrm/config @{MaxTimeoutms="1800000"} 
winrm set winrm/config/service @{AllowUnencrypted="true"} 
winrm set winrm/config/service/auth @{Basic="true"} 
sc config WinRM start= auto