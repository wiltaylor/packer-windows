$Script:LogPath = 'c:\windows\temp\build.log'

function Set-LogFile {
    param([String]$Path)

    $Script:LogPath = $Path
}
function Write-LogMSG {
    param([ValidateSet('Info', 'Debug', 'Warn', 'Error', 'Fatal')][String]$Level="$Info", $Message)

    $timestamp = Get-Date -Format 'HH:mm d/M/yyyy'

    "[$timestamp][$Level]: $Message" | Out-File -FilePath $Script:LogPath -Append -Encoding utf8
    Write-Host "[$timestamp][$Level]: $Message"
}

function Get-WebItem {
    param($URI, $Destination)

    try
    {
        Write-LogMSG Info "Downloading $URI to $Destination"
        Start-Restartable -Times 6 -Delay 10 -CodeBlock {
            (New-Object System.Net.WebClient).DownloadFile($URI, $Destination)
        }
    }
    catch
    {
        Write-LogMSG Error "Failed to download file. Error: $_"
        throw "Failed to download file $URI!"
    }
    
    Write-LogMSG Info 'Download complete'
}

function Invoke-Exe {
    param($Exe, $ArgumentList)

    try 
    {
        Write-LogMSG Info "Starting process: EXE - $Exe  Argument List - $ArgumentList"
        Start-Process -FilePath $Exe -ArgumentList $ArgumentList -Wait
    }
    catch{
        Write-LogMSG Error "Failed to execute process! Error:$_"
        throw "Failed to execute $Exe $ArgumentList"
    } 
}

function Install-WebPackage {
    param([string]$URI, $Destination, $Exe, $ArgumentList)

    Get-WebItem -URI $URI -Destination $Destination
    
    Invoke-Exe -Exe $Exe -ArgumentList $ArgumentList
}

function Register-Startup {
    param($user, $password, $title, $path, $ArgumentList )
    
    try {    
        $schexe = 'C:\windows\system32\schtasks.exe'
        $schargs = "/create /tn `"$title`" /tr `"\`"$path\`" $ArgumentList`" /sc onstart /RU $user /RP $password /RL HIGHEST"

        Write-LogMSG Info "Registering Startup Task: User - $user Password - $Password Title - $title -Path $path -Args $args"
        Write-LogMSG Info "Command: $schexe $schargs"

        $Proc = Start-Process -FilePath $schexe -ArgumentList $schargs -PassThru
        $proc.WaitForExit()        
    }
    catch {
        Write-LogMSG Error "Failed to register startup item! Error:$_"
        throw 'Failed to register startup item'
    }
}

function Unregister-Startup {
    param($title)
    
    try {    
        
        Write-LogMSG Info "Unregistering startup task: $title"
        $schexe = 'C:\windows\system32\schtasks.exe'
        $schargs = "/delete /tn `"$title`" /F"
        Write-LogMSG Info "Command: $schexe $schargs"

        $Proc = Start-Process -FilePath $schexe -ArgumentList $schargs -PassThru
        $proc.WaitForExit()

    }
    catch {
        Write-LogMSG Error "Failed to unregister startup item! Error:$_"
        throw 'Failed to unregister startup item'
    }
}

function Start-Restartable {
    param([int]$Times,$Delay=10,[scriptblock]$CodeBlock)

    $retries = $Times

    while($retries -gt 0){
        try
        {
            $CodeBlock.Invoke($null)
            $retries =-1
        }catch
        {
            $retries--
            if($retries -eq 0) { break }
            Write-LogMSG Warn "Exception raised by restartable Error: $_"
            Write-LogMSG Warn "Retrying in $Delay... Retries left: $retries"
            Start-Sleep -Seconds $Delay
        }
    }

    if($retries -ne -1) { 
        throw "Code failed $Times."
    }
}