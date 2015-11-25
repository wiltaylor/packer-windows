<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2015 v4.2.95
	 Created on:   	22/10/2015 10:21 AM
	 Created by:   	Wil Taylor
	 Organization:
	 Filename:     	Build.ps1
	===========================================================================
	.DESCRIPTION
		This script will build a System
#>
Set-ItemProperty -Path HKLM:\software\Microsoft\Windows\CurrentVersion\Run -Name BuildScript -Value "cmd.exe /c powershell.exe -executionpolicy bypass -noprofile -noninteractive -file a:\Build.ps1" -Force

foreach ($i in Get-ChildItem "a:\" | Sort-Object -Property Name)
{
	if ($i -like "build*-*.cmd" -or $i -like "build*-*.ps1")
	{
		if($i.Name.ToLower() -eq "build.ps1") { continue }

		&$i.FullName
	}
}

Remove-ItemProperty -Path HKLM:\software\Microsoft\Windows\CurrentVersion\Run -Name BuildScript -Force
