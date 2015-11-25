if (-not (Test-Path "C:\Windows\Temp\caffeine.zip"))
{
	(New-Object System.Net.WebClient).DownloadFile('http://www.getchef.com/chef/install.msi', 'C:\Windows\Temp\chef.msi')
}

$shell = new-object -com shell.application
$zip = $shell.NameSpace("C:\Windows\Temp\caffeine.zip")
foreach ($item in $zip.items())
{
	$shell.Namespace("C:\Windows\Temp").copyhere($item)
}

&c:\Windows\Temp\caffeine.exe