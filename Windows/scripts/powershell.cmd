@echo off

Echo Setting powershell execution policy
C:\windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force"
C:\windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe -Command "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force"