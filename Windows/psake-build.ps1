task default -depends BuildAll

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

task ImportBox -depends ImportBoxWindows7, ImportBoxWindows8
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