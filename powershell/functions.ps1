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

# for aliases
function Invoke-GitStatus(){ git status $Args }
function Invoke-GitAdd(){ git add $Args }
function Invoke-GitLogOneLine(){ git log --oneline $Args }
function Invoke-GitCommit(){ git commit $Args }
function Invoke-GitDiff(){ git diff $Args }
function Invoke-GitDiffCached(){ git diff --cached $Args }
function Invoke-GitSwitch(){ git switch $Args }
function Invoke-GitSwitchCreate(){ git switch -c $Args }
function Invoke-GitBranch(){ git branch $Args }
function Invoke-GitMerge(){ git merge $Args }
function Invoke-GitPull(){ git pull $Args }
function Invoke-GitBranchAll(){ git branch -a $Args }
function Invoke-OpenCurrentDirectory(){ explorer.exe . $Args }
function Invoke-QueryUser(){ query user $Args }
