Set-Location 'F:\Virtual Machines\BaseOS\Windows'

foreach($item in Get-ChildItem 'F:\Virtual Machines\BaseOS\Windows' -Filter *.json) {
    &packer build $item.Name
}


foreach($item in Get-ChildItem 'F:\Virtual Machines\BaseOS\Windows' -Filter *.box) {
    $name = $item.Name.Replace(".box", "")

    &vagrant box add -name $name --force $item.FullName
}