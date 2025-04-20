# Import-Modules
Import-Module PSReadline
Import-Module "${PSScriptRoot}\Modules\SelfModule.Functions"

# Remove all default aliases
Remove-Item -Force alias:*

# Set aliaes
Set-Alias clear Clear-Host
Set-Alias cls Clear-Host
Set-Alias ls Get-ChildItem
function  lsn { Get-ChildItem -Name $Args }
Set-Alias echo Write-Host
Set-Alias cat Get-Content
Set-Alias cd Set-Location
Set-Alias mv Move-Item
Set-Alias cp Copy-Item
Set-Alias rm New-TrashItem
Set-Alias clstrash Clear-TrashDir
function  mkdir { New-Item -ItemType Directory -Force -Path $Args }
Set-Alias cfj ConvertFrom-Json
function  ctj { $input | ForEach-Object { ConvertTo-Json -Depth 10 $_ } }
Set-Alias tee Tee-Object
Set-Alias % ForEach-Object
Set-Alias ? Where-Object
Set-Alias sort Sort-Object
Set-Alias cat Get-Content
Set-Alias touch New-EmptyFile
function  op { explorer.exe $Args }
function  opc { explorer.exe . $Args }

Set-Alias tf terraform
Set-Alias py python
Set-Alias kb kubectl
function  kbn { kubectl -n $env:K8S_USING_NAMESPACE $Args }
function  fv { vim (fzf) }

function  gst(){ git status $Args }
function  ga(){ git add $Args }
function  gap(){ git add -p $Args }
function  gc(){ git commit $Args }
function  gcm(){ git commit -m $Args }
function  gm(){ git merge $Args }
function  gd(){ git diff $Args }
function  gdc(){ git diff --cached $Args }
function  gs(){ git switch $Args }
function  gsc(){ git switch -c $Args }
function  gb(){ git branch $Args }
function  gba(){ git branch -a $Args }
function  gbd(){ git branch -d $Args }
function  gl(){ git log $Args }
function  glo(){ git log --oneline $Args }

Set-Alias srl Set-RepositoryLocation
Set-Alias watch Invoke-Watch

# Set environment variables
$env:GIT_CONFIG= "$HOME\Config\git\config"
$env:PATH = "$env:PATH"

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
$localConfigPath = "$PSScriptRoot\profile_local.ps1"
if(Test-Path $localConfigPath){
    . $localConfigPath
}
