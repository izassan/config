# Import-Modules
Import-Module PSReadline
Import-Module "${PSScriptRoot}\Modules\SelfModule.Functions"

# Remove all default aliases
Remove-Item -Force alias:*

# Set aliaes
Set-Alias clear Clear-Host
Set-Alias echo Write-Host
Set-Alias cat Get-Content
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
Set-Alias srl Set-RepositoryLocation
Set-Alias tf terraform
Set-Alias kb kubectl
Set-Alias py python
Set-Alias watch Invoke-Watch

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
function kbn(){ kubectl -n $USING_NAMESPACE $Args }

function gst(){ git status $Args }
function ga(){ git add $Args }
function gap(){ git add -p $Args }
function gc(){ git commit $Args }
function gcm(){ git commit -m $Args }
function gm(){ git merge $Args }
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
$env:GOPATH = "$HOME\local\opt\go"
$env:PYTHONUSERBASE = "$HOME\local\pip"
$PYTHON_VERSION = (python --version).split(" ")[1].split(".")
$PYTHON_BIN_DIR = "$env:PYTHONUSERBASE\Python{0}{1}\Scripts" `
                        -f $PYTHON_VERSION[0],$PYTHON_VERSION[1]
$env:PATH = "$env:PATH;$env:GOPATH\bin;$PYTHON_BIN_DIR"

# Add vi keybinding mode
Set-PSReadLineOption -EditMode Vi

# Set History Settings
Set-PSReadLineOption -HistoryNoDuplicates

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
