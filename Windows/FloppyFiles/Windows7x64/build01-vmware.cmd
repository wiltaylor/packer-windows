@echo off
IF EXIST "C:\Program Files\VMware\VMware Tools\vmtoolsd.exe" GOTO done

ping 1.1.1.1 -n 1 -w 2000 >nul
start /min /wait a:\upgrader.exe -p "/s /v\"/qr REBOOT=FORCE REBOOTPROMPT=S\""
ping 1.1.1.1 -n 1 -w 30000 >nul
:done
