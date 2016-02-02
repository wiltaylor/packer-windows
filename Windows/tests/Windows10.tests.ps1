Set-Location $PSScriptRoot
$hypervisors = @('vmware', 'virtualbox')

$OSList = @(
    @{
        name = "Windows10x64"
        longname = "Windows10 x64"
    },
    @{
        name = "Windows10x86"
        longname = "Windows10 x86"
    }
)

foreach($h in $hypervisors)
{
    $provider = ""
    $boxtype = ""

    switch($h){
        "vmware" { $provider = "vmware_workstation"; $boxtype = "vmware_desktop"}
        default {$provider = $h; $boxtype = $h}
    }

    foreach($os in $OSList)
    {

        $osname = $os.name
        $longosname = $os.longname

        Describe "$longosname-Base-$h" {

            #removing existing box if set.
            try { &vagrant box remove --force --provider $boxtype "$osname-base" 2>&1 | out-null } catch {}
            Remove-Item .\.vagrant -Force -Recurse -ErrorAction SilentlyContinue
            Remove-Item .\VagrantFile -ErrorAction SilentlyContinue

            It 'Can be imported' {
                &vagrant box add --name "$osname-base" "../$osname-base-$h.box"
                $boxes = &vagrant box list
                $boxes -like "$osname-base*$h*"| should not BeNullOrEmpty
            }

            It 'Can be brought up' {
                &vagrant init "$osname-base"
                $ret = &vagrant up --provider $provider
                $ret -like "Error" | should BeNullOrEmpty

            }

            It 'Can run powershell commands' {
                $ret = &vagrant powershell --command "Get-Host"

                $ret -like "*ConsoleHost*" | should not BeNullOrEmpty
            }

            It 'Can be destroryed' {
                $ret = &vagrant destroy -f
                $ret -like "*Error*" | should BeNullOrEmpty
            }

            It 'Can be removed' {
                $ret  = &vagrant box remove --force --provider $boxtype "$osname-base"
                $ret -like "*Error*" | foreach-object { if($_ -eq $false) { $null } else { $_} } | should BeNullOrEmpty #fixes weird bug where $false is passed instead of null causing test to fail.
                $boxes = &vagrant box list        
                $boxes -like "$osname-base*$h*"| should BeNullOrEmpty
            }

            Remove-Item .\.vagrant -Force -Recurse -ErrorAction SilentlyContinue
            Remove-Item .\VagrantFile -ErrorAction SilentlyContinue
        }
    }
}