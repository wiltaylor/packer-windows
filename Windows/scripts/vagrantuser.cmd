@echo off

::Prevent user from expiring
wmic useraccount where "name='vagrant'" set PasswordExpires=FALSE

net accounts /MAXPWAGE:UNLIMITED

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 0 /f