@echo off

::Prevent user from expiring
wmic useraccount where "name='vagrant'" set PasswordExpires=FALSE

net accounts /MAXPWAGE:UNLIMITED

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f

copy a:\sysprep.xml c:\windows\temp\sysprep.xml
copy a:\fixnetwork.ps1 c:\windows\temp\fixnetwork.ps1