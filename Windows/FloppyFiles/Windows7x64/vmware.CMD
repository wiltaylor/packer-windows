@echo  Installing VMware Tools ...  Please wait a few seconds.
@echo off

:: delay 2 seconds before running upgrader to prevent some timing issue with
:: mounting iso cd-rom device (because winnt/2k/2003 don't have 'sleep' command
:: use old trick with 'ping')
ping 1.1.1.1 -n 1 -w 2000 >nul
start /min /wait a:\upgrader.exe -p "/s /v\"/qr REBOOT=FORCE REBOOTPROMPT=S\""
