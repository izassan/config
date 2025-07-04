# Import-Modules
Import-Module PSReadline


# Set environment variables
$env:XDG_CONFIG_HOME  = "$HOME\.config"
$env:XDG_CACHE_HOME   = "$HOME\.local\cache"
$env:XDG_DATA_HOME    = "$HOME\.local\share"
$env:XDG_STATE_HOME   = "$HOME\.local\state"

$env:GOPATH = "$env:XDG_DATA_HOME\go"
$env:SCOOP = "$env:XDG_DATA_HOME\scoop"
$env:STARSHIP_CACHE = "$env:XDG_CACHE_HOME\starship"
$env:KUBECACHEDIR = "$env:XDG_CACHE_HOME\kubectl"

$env:GIT_CONFIG_GLOBAL = "$env:XDG_CONFIG_HOME\git\config"
$env:KUBECONFIG = "$env:XDG_CONFIG_HOME\kubeconfig"
$env:PATH = "$env:PATH;$env:GOPATH\bin"


# Set PSReadLineOption
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadlineOption -BellStyle None


# Define Functions
. $PSScriptRoot\functions.ps1


# Configure Prompt
if(Get-Command starship -ea SilentlyContinue){
    Invoke-Expression (&starship init powershell)
}else{
    . $PSScriptRoot\prompt.ps1
}


# Configure Alias
if(Get-Command maskcmd -ea SilentlyContinue){
    if($PSVersionTable.PSVersion.Major -eq 7){
        Invoke-Expression (&maskcmd generate powershell --init)
    }
}

# Load local config
$localConfigPath = "$PSScriptRoot\profile_local.ps1"
if(Test-Path $localConfigPath){
    . $localConfigPath
}
