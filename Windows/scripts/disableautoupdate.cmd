@echo off

reg.exe add "HKLM\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1
reg.exe add "HKLM\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUState /t REG_DWORD /d 7