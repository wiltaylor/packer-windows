@echo off

::This will only run if the vmware tools upgrader is present.

if not exist a:\upgrader.exe goto exit
start /min /wait a:\upgrader.exe -p "/s /v\"/qr REBOOT=ReallySupress\""

sleep 180

:exit