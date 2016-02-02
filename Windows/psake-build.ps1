properties {
    $Windows10x64json = @{
        OSNAME = "Windows10x64"
        OSNAMELONG = "Windows 10 x64"
        ISO = "en_windows_10_enterprise_version_1511_x64_dvd_7224901.iso"
        ISOMD5 = "6d11fd855c9d5356f47c90f89ecd9283"
        VBOXOS = "Windows10_64"
        VMWAREOS = "windows9-64"
    }

    $Windows10x86json = @{
        OSNAME = "Windows10x86"
        OSNAMELONG = "Windows 10 x86"
        ISO = "en_windows_10_enterprise_version_1511_x86_dvd_7224912.iso"
        ISOMD5 = "ac6df5aaa6b3755fc6e8e2cb7d5294dd"
        VBOXOS = "Windows10"
        VMWAREOS = "windows9"
    }

    $Windows2008R2x64json = @{
        OSNAME = "Windows2008R2x64"
        OSNAMELONG = "Windows 2008R2 x64"
        ISO = "en_windows_server_2008_r2_with_sp1_x64_dvd_617601.iso"
        ISOMD5 = "8dcde01d0da526100869e2457aafb7ca"
        VBOXOS = "Windows2008_64"
        VMWAREOS = "windows7srv-64"
    }

    $Windows2012Corex64json = @{
        OSNAME = "Windows2012Corex64"
        OSNAMELONG = "Windows 2012Core x64"
        ISO = "en_windows_server_2012_x64_dvd_915478.iso"
        ISOMD5 = "da91135483e24689bfdaf05d40301506"
        VBOXOS = "Windows2012_64"
        VMWAREOS = "windows8srv-64"
    }

    $Windows2012R2Corex64json = @{
        OSNAME = "Windows2012R2Corex64"
        OSNAMELONG = "Windows 2012R2Core x64"
        ISO = "en_windows_server_2012_r2_x64_dvd_2707946.iso"
        ISOMD5 = "0e7c09aab20dec3cd7eab236dab90e78"
        VBOXOS = "Windows2012_64"
        VMWAREOS = "windows8srv-64"
    }

    $Windows2012R2Corex64json = @{
        OSNAME = "Windows2012R2Corex64"
        OSNAMELONG = "Windows 2012R2Core x64"
        ISO = "en_windows_server_2012_r2_x64_dvd_2707946.iso"
        ISOMD5 = "0e7c09aab20dec3cd7eab236dab90e78"
        VBOXOS = "Windows2012_64"
        VMWAREOS = "windows8srv-64"
    }

    $Windows2012R2x64json = @{
        OSNAME = "Windows2012R2x64"
        OSNAMELONG = "Windows 2012R2 x64"
        ISO = "en_windows_server_2012_r2_x64_dvd_2707946.iso"
        ISOMD5 = "0e7c09aab20dec3cd7eab236dab90e78"
        VBOXOS = "Windows2012_64"
        VMWAREOS = "windows8srv-64"
    }

    $Windows2012R2Corex64json = @{
        OSNAME = "Windows2012R2x64"
        OSNAMELONG = "Windows 2012R2 x64"
        ISO = "en_windows_server_2012_r2_x64_dvd_2707946.iso"
        ISOMD5 = "0e7c09aab20dec3cd7eab236dab90e78"
        VBOXOS = "Windows2012_64"
        VMWAREOS = "windows8srv-64"
    }

    $Windows7x64json = @{
        OSNAME = "Windows7x64"
        OSNAMELONG = "Windows 7 x64"
        ISO = "en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso"
        ISOMD5 = "6467c3875955df4514395f0afcaaa62a"
        VBOXOS = "Windows7_64"
        VMWAREOS = "windows7-64"
    }

    $Windows7x86json = @{
        OSNAME = "Windows7x86"
        OSNAMELONG = "Windows 7 x86"
        ISO = "en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso"
        ISOMD5 = "d6044be7093fb2737db63d340a1b2a03"
        VBOXOS = "Windows7"
        VMWAREOS = "windows7"
    }

    $Windows81x64json = @{
        OSNAME = "Windows8.1x64"
        OSNAMELONG = "Windows 8.1 x64"
        ISO = "en_windows_8_1_enterprise_x64_dvd_2971902.iso"
        ISOMD5 = "8e194185fcce4ea737f274ee9005ddf0"
        VBOXOS = "Windows81_64"
        VMWAREOS = "windows8-64"
    }

    $Windows81x86json = @{
        OSNAME = "Windows8.1x86"
        OSNAMELONG = "Windows 8.1 x86"
        ISO = "en_windows_8_1_enterprise_x86_dvd_2972289.iso"
        ISOMD5 = "bf620a67b5dda1e18e9ce17d25711201"
        VBOXOS = "Windows81"
        VMWAREOS = "windows8"
    }

    $Windows8x64json = @{
        OSNAME = "Windows8x64"
        OSNAMELONG = "Windows 8 x64"
        ISO = "en_windows_8_enterprise_x64_dvd_917522.iso"
        ISOMD5 = "27aa354b8088527ffcd32007b51b25bf"
        VBOXOS = "Windows8_64"
        VMWAREOS = "windows8-64"
    }

    $Windows8x86json = @{
        OSNAME = "Windows8x86"
        OSNAMELONG = "Windows 8 x86"
        ISO = "en_windows_8_enterprise_x86_dvd_917587.iso"
        ISOMD5 = "ad055cae50cef987586c51cc6cc3c62e"
        VBOXOS = "Windows8"
        VMWAREOS = "windows8"
    }
}

task default -depends BuildAll, TestAll

task BuildAll -depends BuildWindows7, BuildWindows8, BuildWindows81, BuildWindows10, BuildWindows2008R2, BuildWindows2012, BuildWindows2012R2

task BuildWindows7 -depends BuildWindows7x64, BuildWindows7x86
task BuildWindows8 -depends BuildWindows8x64, BuildWindows8x86
task BuildWindows81 -depends BuildWindows81x64, BuildWindows81x86
task BuildWindows10 -depends BuildWindows10x64, BuildWindows10x86
task BuildWindows2008R2 -depends BuildWindows2008R2x64
task BuildWindows2012 -depends BuildWindows2012x64, BuildWindows2012Corex64
task BuildWindows2012R2 -depends BuildWindows2012R2x64, BuildWindows2012R2Corex64

task BuildWindows7x64 {
	&packer build -force .\Windows7x64-base.json
}

task BuildWindows7x86 {
	&packer build -force .\Windows7x86-base.json
}

task BuildWindows8x64 {
    &packer build -force .\Windows8x64-base.json
}

task BuildWindows8x86 {
    &packer build -force .\Windows8x86-base.json
}

task BuildWindows81x64 {
    &packer build -force .\Windows8.1x64-base.json
}

task BuildWindows81x86 {
    &packer build -force .\Windows8.1x86-base.json
}

task BuildWindows10x64 {
    &packer build -force .\Windows10x64-base.json
}

task BuildWindows10x86 {
    &packer build -force .\Windows10x86-base.json
}

task BuildWindows2008R2x64 {
    &packer build -force .\Windows2008R2x64-base.json
}

task BuildWindows2012x64 {
    &packer build -force .\Windows2012x64-base.json
}

task BuildWindows2012Corex64 {
    &packer build -force .\Windows2012Corex64-base.json
}

task BuildWindows2012R2x64 {
    &packer build -force .\Windows2012R2x64-base.json
}

task BuildWindows2012R2Corex64 {
    &packer build -force .\Windows2012R2Corex64-base.json
}

task ImportBox -depends ImportBoxWindows7, ImportBoxWindows8, ImportBoxWindows81, ImportBoxWindows10, ImportBoxWindows2008R2, ImportBoxWindows2012, ImportBoxWindows2012R2
task ImportBoxWindows7 -depends ImportBoxWindows7x64, ImportBoxWindows7x86
task ImportBoxWindows8 -depends ImportBoxWindows8x64, ImportBoxWindows8x86
task ImportBoxWindows81 -depends ImportBoxWindows81x64, ImportBoxWindows81x86
task ImportBoxWindows10 -depends ImportBoxWindows10x64, ImportBoxWindows10x86
task ImportBoxWindows2008R2 -depends ImportBoxWindows2008R2x64
task ImportBoxWindows2012 -depends ImportBoxWindows2012x64, ImportBoxWindows2012Corex64
task ImportBoxWindows2012R2 -depends ImportBoxWindows2012R2x64, ImportBoxWindows2012R2Corex64

task ImportBoxWindows7x64 -depends RemoveBoxWindows7x64 {
    vagrant box add --name Windows7x64-base .\Windows7x64-base-vmware.box
    vagrant box add --name Windows7x64-base .\Windows7x64-base-virtualbox.box
}

task ImportBoxWindows7x86 -depends RemoveBoxWindows7x86 {
    vagrant box add --name Windows7x86-base .\Windows7x86-base-vmware.box
    vagrant box add --name Windows7x86-base .\Windows7x86-base-virtualbox.box
}

task ImportBoxWindows8x64 -depends RemoveBoxWindows8x64 {
    vagrant box add --name Windows8x64-base .\Windows8x64-base-vmware.box
    vagrant box add --name Windows8x64-base .\Windows8x64-base-virtualbox.box
}

task ImportBoxWindows8x86 -depends RemoveBoxWindows8x86 {
    vagrant box add --name Windows8x86-base .\Windows8x86-base-vmware.box
    vagrant box add --name Windows8x86-base .\Windows8x86-base-virtualbox.box
}

task ImportBoxWindows81x64 -depends RemoveBoxWindows81x64 {
    vagrant box add --name Windows8.1x64-base .\Windows8.1x64-base-vmware.box
    vagrant box add --name Windows8.1x64-base .\Windows8.1x64-base-virtualbox.box
}

task ImportBoxWindows81x86 -depends RemoveBoxWindows81x86 {
    vagrant box add --name Windows8.1x86-base .\Windows8.1x86-base-vmware.box
    vagrant box add --name Windows8.1x86-base .\Windows8.1x86-base-virtualbox.box
}

task ImportBoxWindows10x64 -depends RemoveBoxWindows10x64 {
    vagrant box add --name Windows10x64-base .\Windows10x64-base-vmware.box
    vagrant box add --name Windows10x64-base .\Windows10x64-base-virtualbox.box
}

task ImportBoxWindows10x86 -depends RemoveBoxWindows10x86 {
    vagrant box add --name Windows10x86-base .\Windows10x86-base-vmware.box
    vagrant box add --name Windows10x86-base .\Windows10x86-base-virtualbox.box
}

task ImportBoxWindows2008R2x64 -depends RemoveBoxWindows2008R2x64 {
    vagrant box add --name Windows2008R2x64-base .\Windows2008R2x64-base-vmware.box
    vagrant box add --name Windows2008R2x64-base .\Windows2008R2x64-base-virtualbox.box
}

task ImportBoxWindows2012x64 -depends RemoveBoxWindows2012x64 {
    vagrant box add --name Windows20012x64-base .\Windows2012x64-base-vmware.box
    vagrant box add --name Windows20012x64-base .\Windows2012x64-base-virtualbox.box
}

task ImportBoxWindows2012Corex64 -depends RemoveBoxWindows2012Corex64 {
    vagrant box add --name Windows20012Corex64-base .\Windows2012Corex64-base-vmware.box
    vagrant box add --name Windows20012Corex64-base .\Windows2012Corex64-base-virtualbox.box
}

task ImportBoxWindows2012R2x64 -depends RemoveBoxWindows2012R2x64 {
    vagrant box add --name Windows20012R2x64-base .\Windows2012R2x64-base-vmware.box
    vagrant box add --name Windows20012R2x64-base .\Windows2012R2x64-base-virtualbox.box
}

task ImportBoxWindows2012R2Corex64 -depends RemoveBoxWindows2012R2Corex64 {
    vagrant box add --name Windows20012R2Corex64-base .\Windows2012R2Corex64-base-vmware.box
    vagrant box add --name Windows20012R2Corex64-base .\Windows2012R2Corex64-base-virtualbox.box
}

task RemoveBoxWindows7x64 {
    vagrant box remove --force --provider vmware_desktop Windows7x64-base
    vagrant box remove --force --provider virtualbox Windows7x64-base
} 

task RemoveBoxWindows7x86 {
    vagrant box remove --force --provider vmware_desktop Windows7x86-base
    vagrant box remove --force --provider virtualbox Windows7x86-base
} 

task RemoveBoxWindows8x64 {
    vagrant box remove --force --provider vmware_desktop Windows8x64-base
    vagrant box remove --force --provider virtualbox Windows8x64-base
} 

task RemoveBoxWindows8x86 {
    vagrant box remove --force --provider vmware_desktop Windows8x86-base
    vagrant box remove --force --provider virtualbox Windows8x86-base
} 

task RemoveBoxWindows81x64 {
    vagrant box remove --force --provider vmware_desktop Windows8.1x64-base
    vagrant box remove --force --provider virtualbox Windows8.1x64-base
} 

task RemoveBoxWindows81x86 {
    vagrant box remove --force --provider vmware_desktop Windows8.1x86-base
    vagrant box remove --force --provider virtualbox Windows8.1x86-base
} 

task RemoveBoxWindows10x64 {
    vagrant box remove --force --provider vmware_desktop Windows10x64-base
    vagrant box remove --force --provider virtualbox Windows10x64-base
} 

task RemoveBoxWindows10x86 {
    vagrant box remove --force --provider vmware_desktop Windows10x86-base
    vagrant box remove --force --provider virtualbox Windows10x86-base
} 

task RemoveBoxWindows2008R2x64 {
    vagrant box remove --force --provider vmware_desktop Windows2008R2x64-base
    vagrant box remove --force --provider virtualbox Windows2008R2x64-base
} 

task RemoveBoxWindows2012x64 {
    vagrant box remove --force --provider vmware_desktop Windows2012x64-base
    vagrant box remove --force --provider virtualbox Windows2012x64-base
} 

task RemoveBoxWindows2012Corex64 {
    vagrant box remove --force --provider vmware_desktop Windows2012Corex64-base
    vagrant box remove --force --provider virtualbox Windows2012Corex64-base
} 

task RemoveBoxWindows2012R2x64 {
    vagrant box remove --force --provider vmware_desktop Windows2012R2x64-base
    vagrant box remove --force --provider virtualbox Windows2012R2x64-base
} 

task RemoveBoxWindows2012R2Corex64 {
    vagrant box remove --force --provider vmware_desktop Windows2012R2Corex64-base
    vagrant box remove --force --provider virtualbox Windows2012CoreR2x64-base
} 

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