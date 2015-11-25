$client = New-Object System.Net.WebClient

if(-not(Test-Path 'c:\windows\temp\tools-windows.tar'))
{
    $client.DownloadFile('http://softwareupdate.vmware.com/cds/vmw-desktop/ws/12.0.1/3160714/windows/packages/tools-windows.tar','c:\windows\temp\tools-windows.tar')
}

if(Test-Path "C:\Program Files (x86)")
{
  if(-not(Test-Path 'c:\windows\temp\7z920.msi'))
  {
    $client.DownloadFile('http://www.7-zip.org/a/7z920-x64.msi', 'c:\windows\temp\7z920.msi')
  }
}
else
{
  if(-not(Test-Path 'c:\windows\temp\7z920.msi'))
  {
    $client.DownloadFile('http://www.7-zip.org/a/7z920.msi', 'c:\windows\temp\7z920.msi')
  }
}

&"c:\windows\system32\msiexec.exe" /i 'c:\windows\temp\7z920.msi' /qn REBOOT=ReallySupress | out-null

&"C:\Program Files\7-Zip\7z.exe" x -y "c:\windows\temp\tools-windows.tar" -oC:\windows\temp | out-null
&"C:\Program Files\7-Zip\7z.exe" x -y "c:\windows\temp\VMware-tools-windows-10.0.1-3160059.iso" -oC:\windows\temp | out-null
&"c:\windows\temp\setup.exe" /s /v/qn | out-null

&"c:\windows\system32\msiexec.exe" /x 'c:\windows\temp\7z920.msi' /qn | out-null
