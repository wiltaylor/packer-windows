# Get network connections 
$networkListManager = [Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]"{DCB00C01-570F-4A9B-8D69-199FDBA5723B}"))
$connections = $networkListManager.GetNetworkConnections()

# Set network location to Private for all networks 
$connections | % { $_.GetNetwork().SetCategory(1) }

Enable-PSRemoting -Force
Set-ExecutionPolicy RemoteSigned -Force

Set-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB -Value 800
Set-Item WSMan:\localhost\MaxTimeoutms -Value 1800000
Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $true
Set-Item WSMan:\localhost\Service\Auth\Basic -Value $true
set-item WSMan:\localhost\Listener\*\port -Value 5985
set-item WSMan:\localhost\Listener\*\Transport -Value HTTP

sc config WinRM start=auto
&netsh advfirewall firewall set rule group="Windows Remote Management" new enable=yes
&netsh advfirewall firewall add rule name="winrm"  dir=in action=allow protocol=TCP localport=5985
