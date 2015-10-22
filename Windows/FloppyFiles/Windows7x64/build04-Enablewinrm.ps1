# Get network connections
$networkListManager = [Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]"{DCB00C01-570F-4A9B-8D69-199FDBA5723B}"))
$connections = $networkListManager.GetNetworkConnections()

# Set network location to Private for all networks
$connections | % { $_.GetNetwork().SetCategory(1) }

Enable-PSRemoting -Force
Start-Service WinRm
Start-Sleep 60
Set-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB -Value 800 -Force
Set-Item WSMan:\localhost\MaxTimeoutms -Value 1800000 -Force
Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $true -Force
Set-Item WSMan:\localhost\Service\Auth\Basic -Value $true -Force
set-item WSMan:\localhost\Listener\*\port -Value 5985 -Force

Invoke-Expression "sc.exe config WinRM start= auto"
&netsh advfirewall firewall set rule group="Windows Remote Management" new enable=yes
&netsh advfirewall firewall add rule name="winrm"  dir=in action=allow protocol=TCP localport=5985
