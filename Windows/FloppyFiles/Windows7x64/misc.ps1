Set-ExecutionPolicy RemoteSigned -Force
&net accounts /MAXPWAGE:UNLIMITED
&powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
&net user administrator /active:yes
&reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
&reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f
&netsh firewall set service type = remotedesktop mode = enabled