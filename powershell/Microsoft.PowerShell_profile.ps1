# Remove all default aliases
Remove-Item -Force alias:*

# Load other script files
. $PSScriptRoot\functions.ps1

# Set aliaes
Set-Alias clear Clear-Host
Set-Alias echo Write-Host
Set-Alias cd Set-Location
Set-Alias rm Remove-Item
Set-Alias mv Move-Item
Set-Alias cp Copy-Item
Set-Alias cl Clear-Host
Set-Alias cfj ConvertFrom-Json
Set-Alias tee Tee-Object
Set-Alias % ForEach-Object
Set-Alias ? Where-Object
Set-Alias sort Sort-Object
Set-Alias cat Get-Content

function ls(){ Get-ChildItem -Exclude _*,.* $Args }
function lsn(){ Get-ChildItem -Name -Exclude _*,.* $Args }
function lsf(){ Get-ChildItem -Name -Force $Args }
function rmrf(){ Remove-Item -Recurse -Force $Args }
function cpr(){ Copy-Item -Recurse $Args }
function mkdir(){ New-Item -ItemType Directory -Force -Path $Args }
function ctj([Parameter(Mandatory,ValueFromPipeLine)]$inputObject, $depth = 10){ ConvertTo-Json -Depth $depth -InputObject $inputObject }
function op(){ explorer.exe $Args }
function opc(){ explorer.exe . $Args }
function touch([Parameter(Mandatory)]$fp){ Out-File -InputObject "" -FilePath "$fp" }
function v(){ vim . }

function gst(){ git status $Args }
function ga(){ git add $Args }
function gap(){ git add -p $Args }
function gc(){ git commit $Args }
function gcm(){ git commit -m $Args }
function gd(){ git diff $Args }
function gdc(){ git diff --cached $Args }
function gs(){ git switch $Args }
function gsc(){ git switch -c $Args }
function gb(){ git branch $Args }
function gba(){ git branch -a $Args }
function gbd(){ git branch -d $Args }
function gl(){ git log $Args }
function glo(){ git log --oneline $Args }

function mp(){ multipass $Args }
function mpl(){ multipass launch --name devvm --cpus 4 --memory 8G --disk 40G lts }
function mps(){ multipass shell devvm }
function mpt(){ multipass exec -- devvm tmux }

# Set environment variables
$env:GOPATH = "$HOME\local\go"
$env:PYTHONUSERBASE = "$HOME\local\pip"
$env:PATH = "$env:PATH;$env:GOPATH\bin;$env:PYTHONUSERBASE\$USEPYTHONVERSION\Scripts"

# Set vi keybindings
Import-Module PSReadline
Set-PSReadLineOption -EditMode Vi

# Set Prompt
function prompt {
    $version = $PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()
    Write-Output "PS$version $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
}

# Set BellStyle
Set-PSReadlineOption -BellStyle None

# Load local config
$localConfigPath = "$HOME\local_config\powershell.ps1"
if(Test-Path $localConfigPath){
    . $localConfigPath
}
