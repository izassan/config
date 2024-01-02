# functions
function alias ($alias_name, $cmd){
    if(Get-Alias $alias_name 2> $null){ Remove-Alias -Force $alias_name }
    $null = New-Item -Path function: -Name "script:$alias_name" -Value "$cmd `$args"
}

function b64 ([switch]$Decode, [string]$TargetValue){
    if($Decode){ # base64 decoding
        $result = [System.Text.Encoding]::Default.GetString(
            [System.Convert]::FromBase64String($TargetValue))
    }else{ # base64 encoding
        $result = [Convert]::ToBase64String(
            ([System.Text.Encoding]::Default).GetBytes($TargetValue))
    }
    Write-Output $result
}

function IsExistCommand ($cmd){
    Get-Command $cmd -ea SilentlyContinue | Out-Null; return $?
}

function ChangeRepository(){
    if(!(IsExistCommand "ghq" && IsExistCommand "fzf")){ return }
    Set-Location (ghq list --full-path | fzf)
}

function config_init(){
    # install iceberg(vim colorscheme)
    if(!(Test-Path $HOME/vimfiles/colors/iceberg.vim)){
        curl.exe -fLo $HOME/vimfiles/colors/iceberg.vim --create-dirs `
            https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim
    }

    # install vim-plug(vim plugin manager)
    if(!(Test-Path $HOME/vimfiles/autoload/plug.vim)){
        curl.exe -fLo $HOME/vimfiles/autoload/plug.vim --create-dirs `
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    }
}

# environment variables
$env:PATH = "$env:PATH;$env:GOPATH\bin"


# aliases
alias "cr" "ChangeRepository"
alias "op" "explorer.exe"
alias "opc" "explorer.exe ."
alias "br" "Start-Process chrome"

alias "gst" "git status"
alias "ga" "git add"
alias "gap" "git add -p"
alias "gc" "git commit"
alias "gcm" "git commit -m"
alias "gd" "git diff"
alias "gdc" "git diff --cached"
alias "gs" "git switch"
alias "gsc" "git switch -c"

alias "mp" "multipass"
alias "mpl" "multipass list"
alias "mpu" "multipass start"
alias "mpd" "multipass stop"
alias "mps" "multipass shell"

alias "cfg" "Set-Location $HOME/Config"
# key bindings
Import-Module PSReadline
Set-PSReadLineOption -EditMode Vi

# load local configuration
if(Test-Path $HOME/Documents/Powershell/profile_local.ps1){
    . $HOME/Documents/Powershell/profile_local.ps1
}
