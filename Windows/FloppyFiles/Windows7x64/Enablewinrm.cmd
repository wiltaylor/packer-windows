@echo off
cd %temp%
powershell.exe -executionpolicy bypass -file fixnetwork.ps1
winrm quickconfig -q 
winrm quickconfig -transport:http
winrm set winrm/config/winrs @{MaxMemoryPerShellMB="800"} 
winrm set winrm/config @{MaxTimeoutms="1800000"} 
winrm set winrm/config/service @{AllowUnencrypted="true"} 
winrm set winrm/config/service/auth @{Basic="true"} 
winrm set winrm/config/listener?Address=*+Transport=HTTP @{Port="5985"}

echo ==^> Unblocking WinRM port 5985 on the firewall
netsh advfirewall firewall delete rule name="winrm"
@if errorlevel 1 echo ==^> WARNING: Error %ERRORLEVEL% was returned by: netsh advfirewall firewall delete rule name="winrm"

netsh advfirewall firewall set rule group="remote administration" new enable=yes
@if errorlevel 1 echo ==^> WARNING: Error %ERRORLEVEL% was returned by: netsh advfirewall firewall set rule group="remote administration" new enable=yes

echo ==^> Opening WinRM port 5985 on the firewall
:: see http://social.technet.microsoft.com/Forums/windowsserver/en-US/a1e65f0f-2550-49ae-aee2-56a9bdcfb8fb/windows-7-remote-administration-firewall-group?forum=winserverManagement
netsh advfirewall firewall set rule group="Windows Remote Management" new enable=yes
@if errorlevel 1 echo ==^> WARNING: Error %ERRORLEVEL% was returned by: netsh advfirewall firewall set rule group="Windows Remote Management" new enable=yes

netsh advfirewall firewall add rule name="winrm"  dir=in action=allow protocol=TCP localport=5985
@if errorlevel 1 echo ==^> WARNING: Error %ERRORLEVEL% was returned by: netsh advfirewall firewall add rule name="winrm"  dir=in action=allow protocol=TCP localport=5985

sc config WinRM start=auto
net stop winrm
net start winrm