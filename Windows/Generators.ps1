param($Generator, $File, $Properties)

$data = Get-Content $PSScriptRoot\Templates\$Generator

foreach($i in $Properties.Keys) {
    $data = $data -replace "<!$i!>", $Properties[$i]
}

$data | Set-Content $File