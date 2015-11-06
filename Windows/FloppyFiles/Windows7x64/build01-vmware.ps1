$client = New-Object System.Net.WebClient

if(-not(Test-Path 'c:\windows\temp\tools-windows.tar'))
{
    $client.DownloadFile('http://softwareupdate.vmware.com/cds/vmw-desktop/ws/12.0.1/3160714/windows/packages/tools-windows.tar','c:\windows\temp\tools-windows.tar')
}

if(-not(Test-Path 'c:\windows\temp\7zip.zip'))
{
  $client.DownloadFile('http://www.7-zip.org/a/7za920.zip', 'c:\windows\temp\7zip.zip')
}

$shell_app=new-object -com shell.application
$zip = $shell_app.namespace("c:\windows\temp\7zip.zip")
$dest = $shell_app.namespace("c:\windows\temp")
$dest.copyhere($zip.items())

&"c:\windows\temp\7za.exe" x "c:\windows\temp\tools-windows.tar" -oC:\windows\temp | out-null
&"c:\windows\temp\7za.exe" x "c:\windows\temp\VMware-tools-windows-10.0.1-3160059.iso" -oC:\windows\temp | out-null
&"c:\windows\temp\setup.exe /s /v`"/qn REBOOT=ReallySupress`"" | out-null
