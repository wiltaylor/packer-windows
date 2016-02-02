
$hypervisors = @('vmware', 'virtualbox')

$OSList = @(
    @{
        name = "Windows2012x64"
        longname = "Windows2012 x64"
    },
    @{
        name = "Windows2012Corex64"
        longname = "Windows2012Core x64"
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
            &vagrant box remove --force --provider $boxtype "$osname-base" 2>&1 | out-null 
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
                $ret -like "*Error*" | should BeNullOrEmpty
                $boxes = &vagrant box list        
                $boxes -like "$osname-base*$h*"| should BeNullOrEmpty
            }

            Remove-Item .\.vagrant -Force -Recurse -ErrorAction SilentlyContinue
            Remove-Item .\VagrantFile -ErrorAction SilentlyContinue
        }
    }
}