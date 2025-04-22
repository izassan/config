# Import-Modules
Import-Module PSReadline
Import-Module "${PSScriptRoot}\Modules\SelfModule.Functions"


# Set environment variables
$env:GIT_CONFIG_GLOBAL= "$HOME\Config\git\config"
$env:GOPATH = "$HOME\go"
$env:PATH = "$env:PATH;$env:GOPATH\bin"


# Set PSReadLineOption
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadlineOption -BellStyle None


# Configure Prompt
. $PSScriptRoot\prompt.ps1


# Configure Alias
. $PSScriptRoot\aliases.ps1


# Load local config
$localConfigPath = "$PSScriptRoot\profile_local.ps1"
if(Test-Path $localConfigPath){
    . $localConfigPath
}
