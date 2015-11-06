$Session = New-Object -ComObject Microsoft.Update.Session
$Searcher = $Session.CreateUpdateSearcher()
$UpdateServiceManager = New-Object -ComObject Microsoft.Update.ServiceManager
$updates = $Searcher.Search("IsInstalled=0").Updates
$installer = $Session.CreateUpdateInstaller()

if($updates.count -le 0) { return }

Write-Host "Downloading Patches"
$downloader = $Session.CreateUpdateDownloader()
$downloader.Updates = $updates
$downloader.Download() | Out-Null

Write-Host "Applying Patches"
$installer.AllowSourcePrompts = $false
$installer.IsForced = $true
$installer.Updates = $updates
$installer.install() | Out-Null

Restart-Computer -Force
Start-Sleep 5000

