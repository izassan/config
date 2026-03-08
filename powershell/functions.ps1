function Invoke-Watch(){
    Param(
        [Parameter(Mandatory)][scriptblock]$ExecuteScript,
        [int]$Interval = 1,
        [switch]$ClearConsole
    )
    Clear-Host
    while($true){
        Invoke-Command $ExecuteScript
        Start-Sleep -Seconds $Interval
        if($ClearConsole){ Clear-Host }
    }
}

function New-EmptyFile(){ 
    Param(
        [Parameter(Mandatory)][string]$Path
    )
    if(Test-Path $Path){
        return
    }
    Write-Output "" | Out-File -Path $Path 
}
