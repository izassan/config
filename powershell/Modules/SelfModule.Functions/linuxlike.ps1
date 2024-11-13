function Copy-SshId(){
    Param(
        [Parameter(Mandatory)]$Destination,
        $PublicKeyPath = "$HOME\.ssh\id_rsa.pub"
    )
    if(-Not(Test-Path $PublicKeyPath)){
        Write-Error "$PublicKeyPath is not exist"
        return
    }
    Get-Content $PublicKeyPath | ssh $Destination `
    " `
    mkdir -p ~/.ssh && chmod 700 ~/.ssh && `
    cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys `
    "
}

function Invoke-Watch(){
    Param(
        [Parameter(Mandatory)][scriptblock]$ScriptBlock,
        [int]$IntervalTime = 1,
        [switch]$ClearConsole
    )
    while($true){
        Invoke-Command $ScriptBlock
        Start-Sleep -Seconds $IntervalTime
        if($ClearConsole){
            Clear-Host
        }
    }
}

function New-EmptyFile(){
    Param(
        [Parameter(Mandatory)][String[]]$FilePaths
    )
    foreach($f in $FilePaths){
        Out-File -InputObject "" -FilePath $f
    }
}
