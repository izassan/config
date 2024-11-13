function Test-CommandExist([string]$cmd){
    Get-Command $cmd -ea SilentlyContinue | Out-Null; return $?
}


Get-ChildItem $PSScriptRoot\*.ps1 | ForEach-Object {
    . $_
}

function Set-RepositoryLocation(){
    if(-Not(Test-CommandExist "fzf")){
        Write-Host "require 'fzf'"
        return
    }elseif(-Not(Test-CommandExist "ghq")){
        Write-Host "require 'ghq'"
        return
    }
    $rp = ghq list -p | fzf
    if($null -ne $rp){
        Set-Location $rp
    }
}
