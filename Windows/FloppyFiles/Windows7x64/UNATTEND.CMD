@echo  Installing VMware Tools ...  Please wait a few seconds.
@echo off

echo Enable Remote Desktop
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh firewall set service type = remotedesktop mode = enabled

echo Set Local Account Token Filter Policy
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system" /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f

:: delay 2 seconds before running upgrader to prevent some timing issue with
:: mounting iso cd-rom device (because winnt/2k/2003 don't have 'sleep' command 
:: use old trick with 'ping')
ping 1.1.1.1 -n 1 -w 2000 >nul
start /min %TEMP%\upgrader.exe -p "/s /v\"/qr REBOOT=FORCE REBOOTPROMPT=S\""

