$oslist = @(
@{
    OSNAME = "Windows10x64"
    OSNAMELONG = "Windows 10 x64"
    ISO = "en_windows_10_enterprise_version_1511_x64_dvd_7224901.iso"
    ISOMD5 = "6d11fd855c9d5356f47c90f89ecd9283"
    VBOXOS = "Windows10_64"
    VMWAREOS = "windows9-64"
},
@{
    OSNAME = "Windows10x86"
    OSNAMELONG = "Windows 10 x86"
    ISO = "en_windows_10_enterprise_version_1511_x86_dvd_7224912.iso"
    ISOMD5 = "ac6df5aaa6b3755fc6e8e2cb7d5294dd"
    VBOXOS = "Windows10"
    VMWAREOS = "windows9"
},
@{
    OSNAME = "Windows2008R2x64"
    OSNAMELONG = "Windows 2008R2 x64"
    ISO = "en_windows_server_2008_r2_with_sp1_x64_dvd_617601.iso"
    ISOMD5 = "8dcde01d0da526100869e2457aafb7ca"
    VBOXOS = "Windows2008_64"
    VMWAREOS = "windows7srv-64"
},
@{
    OSNAME = "Windows2012Corex64"
    OSNAMELONG = "Windows 2012Core x64"
    ISO = "en_windows_server_2012_x64_dvd_915478.iso"
    ISOMD5 = "da91135483e24689bfdaf05d40301506"
    VBOXOS = "Windows2012_64"
    VMWAREOS = "windows8srv-64"
},
@{
    OSNAME = "Windows2012R2Corex64"
    OSNAMELONG = "Windows 2012R2Core x64"
    ISO = "en_windows_server_2012_r2_x64_dvd_2707946.iso"
    ISOMD5 = "0e7c09aab20dec3cd7eab236dab90e78"
    VBOXOS = "Windows2012_64"
    VMWAREOS = "windows8srv-64"
},
@{
    OSNAME = "Windows2012R2x64"
    OSNAMELONG = "Windows 2012R2 x64"
    ISO = "en_windows_server_2012_r2_x64_dvd_2707946.iso"
    ISOMD5 = "0e7c09aab20dec3cd7eab236dab90e78"
    VBOXOS = "Windows2012_64"
    VMWAREOS = "windows8srv-64"
},
@{
    OSNAME = "Windows2012x64"
    OSNAMELONG = "Windows 2012R2 x64"
    ISO = "en_windows_server_2012_r2_x64_dvd_2707946.iso"
    ISOMD5 = "0e7c09aab20dec3cd7eab236dab90e78"
    VBOXOS = "Windows2012_64"
    VMWAREOS = "windows8srv-64"
},
@{
    OSNAME = "Windows7x64"
    OSNAMELONG = "Windows 7 x64"
    ISO = "en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso"
    ISOMD5 = "6467c3875955df4514395f0afcaaa62a"
    VBOXOS = "Windows7_64"
    VMWAREOS = "windows7-64"
},
@{
    OSNAME = "Windows7x86"
    OSNAMELONG = "Windows 7 x86"
    ISO = "en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso"
    ISOMD5 = "d6044be7093fb2737db63d340a1b2a03"
    VBOXOS = "Windows7"
    VMWAREOS = "windows7"
},
@{
    OSNAME = "Windows8.1x64"
    OSNAMELONG = "Windows 8.1 x64"
    ISO = "en_windows_8_1_enterprise_x64_dvd_2971902.iso"
    ISOMD5 = "8e194185fcce4ea737f274ee9005ddf0"
    VBOXOS = "Windows81_64"
    VMWAREOS = "windows8-64"
},
@{
    OSNAME = "Windows8.1x86"
    OSNAMELONG = "Windows 8.1 x86"
    ISO = "en_windows_8_1_enterprise_x86_dvd_2972289.iso"
    ISOMD5 = "bf620a67b5dda1e18e9ce17d25711201"
    VBOXOS = "Windows81"
    VMWAREOS = "windows8"
},
@{
    OSNAME = "Windows8x64"
    OSNAMELONG = "Windows 8 x64"
    ISO = "en_windows_8_enterprise_x64_dvd_917522.iso"
    ISOMD5 = "27aa354b8088527ffcd32007b51b25bf"
    VBOXOS = "Windows8_64"
    VMWAREOS = "windows8-64"
},
@{
    OSNAME = "Windows8x86"
    OSNAMELONG = "Windows 8 x86"
    ISO = "en_windows_8_enterprise_x86_dvd_917587.iso"
    ISOMD5 = "ad055cae50cef987586c51cc6cc3c62e"
    VBOXOS = "Windows8"
    VMWAREOS = "windows8"
})


task default -depends BuildAll, TestAll

$buildlist = @()
$importlist = @()

foreach ($os in $oslist) {
    task "Generator$($os.OSNAME)" {
        .\Generators.ps1 -Generator "packerjson-base" -File ".\$($os.OSNAME)-base.json" -Properties $os
        .\Generators.ps1 -Generator "vagrantfile-base" -File ".\vagrantfile-$($os.OSNAME).template" -Properties $os
    }

    task "Build$($os.OSNAME)" -depends "Generator$($os.OSNAME)"{
        &packer build -force ".\$($os.OSNAME)-base.json"
    }

    task "ImportBox$($os.OSNAME)" -depends "RemoveBox$($os.OSNAME)" {
        vagrant box add --name "$($os.OSNAME)-base" ".\$($os.OSNAME)-base-vmware.box"
        vagrant box add --name "$($os.OSNAME)-base" ".\$($os.OSNAME)-base-virtualbox.box"
    }

    task "RemoveBox$($os.OSNAME)" {
        vagrant box remove --force --provider vmware_desktop "$($os.OSNAME)-base"
        vagrant box remove --force --provider virtualbox "$($os.OSNAME)-base"
    }

    $buildlist += "Build$($os.OSNAME)"
    $importlist += "ImportBox$($os.OSNAME)"
}

task BuildAll -depends $buildlist
task ImportAll -depends $importlist

#Not using generator because tests may start to vary for different oses.
task TestAll -depends TestWindows7, TestWindows8, TestWindows81, TestWindows10, TestWindows2008R2, TestWindows2012, TestWindows2012R2

task TestWindows7 {
    Remove-Item "$PSScriptRoot\Windows7TestResults.xml" -ErrorAction SilentlyContinue
    Invoke-Pester -Script "$PSScriptRoot\tests\Windows7.tests.ps1" -OutputFile "$PSScriptRoot\Windows7TestResults.xml" -OutputFormat NUnitXml
}

task TestWindows8 {
    Remove-Item "$PSScriptRoot\Windows8TestResults.xml" -ErrorAction SilentlyContinue
    Invoke-Pester -Script "$PSScriptRoot\tests\Windows8.tests.ps1" -OutputFile "$PSScriptRoot\Windows8TestResults.xml" -OutputFormat NUnitXml
}

task TestWindows81 {
    Remove-Item "$PSScriptRoot\Windows8.1TestResults.xml" -ErrorAction SilentlyContinue
    Invoke-Pester -Script "$PSScriptRoot\tests\Windows8.1.tests.ps1" -OutputFile "$PSScriptRoot\Windows8.1TestResults.xml" -OutputFormat NUnitXml
}

task TestWindows10 {
    Remove-Item "$PSScriptRoot\Windows10TestResults.xml" -ErrorAction SilentlyContinue
    Invoke-Pester -Script "$PSScriptRoot\tests\Windows10.tests.ps1" -OutputFile "$PSScriptRoot\Windows10TestResults.xml" -OutputFormat NUnitXml
}

task TestWindows2008R2 {
    Remove-Item "$PSScriptRoot\Windows2008R2TestResults.xml" -ErrorAction SilentlyContinue
    Invoke-Pester -Script "$PSScriptRoot\tests\Windows2008R2.tests.ps1" -OutputFile "$PSScriptRoot\Windows2008R2TestResults.xml" -OutputFormat NUnitXml
}

task TestWindows2012 {
    Remove-Item "$PSScriptRoot\Windows2012TestResults.xml" -ErrorAction SilentlyContinue
    Invoke-Pester -Script "$PSScriptRoot\tests\Windows2012.tests.ps1" -OutputFile "$PSScriptRoot\Windows2012TestResults.xml" -OutputFormat NUnitXml
}

task TestWindows2012R2 {
    Remove-Item "$PSScriptRoot\Windows2012R2TestResults.xml" -ErrorAction SilentlyContinue
    Invoke-Pester -Script "$PSScriptRoot\tests\Windows2012R2.tests.ps1" -OutputFile "$PSScriptRoot\Windows2012R2TestResults.xml" -OutputFormat NUnitXml
}