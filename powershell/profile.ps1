function is_exist_command($cmd){
    Get-Command $cmd -ea SilentlyContinue | Out-Null; return $?
}

function b64 ([string]$plainText){
    $b64Str = [Convert]::ToBase64String(
        ([System.Text.Encoding]::Default).GetBytes($plainText))
    return $b64Str
}

function b64d ([string]$b64Str){
    $plainText = [System.Text.Encoding]::Default.GetString(
        [System.Convert]::FromBase64String($b64Str))
    return $plainText
}

function change_repository(){
    if(!((is_exist_command "ghq") -And (is_exist_command "fzf"))){ return }
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

function copy_ssh_id_to_remote_machine(){
    Param($dest)
    $cmd = "mkdir -p ~/.ssh && chmod 700 ~/.ssh &&"
    $cmd = "$cmd cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
    Get-Content ~/.ssh/id_rsa.pub | ssh $dest "$cmd"
}

function remove_multi_files(){
    Param(
        [array]$Paths,
        [switch]$Recurse,
        [switch]$Force
    )
    foreach($p in $Paths){
        if(($Recurse -And $Force)){
            Remove-Item $p -Force -Recurse
        }elseif($Recurse){
            Remove-Item $p -Recurse
        }elseif($Force){
            Remove-Item $p -Force
        }else{
            Remove-Item $p
        }
    }
}

# environment variables
$env:GOPATH = "$HOME\.go"
$env:PATH = "$env:PATH;$env:GOPATH\bin"

# aliases
function ls(){ Get-ChildItem -Exclude _*,.* $Args }
function lsn(){ Get-ChildItem -Name -Exclude _*,.* $Args }
function lsf(){ Get-ChildItem -Name -Force $Args }
function cr(){ change_repository $Args }
function op(){ explorer.exe $Args }
function opc(){ explorer.exe . $Args }
function br(){ Start-Process chrome $Args }
function cfg(){ Set-Location $HOME/Config $Args }
function ssh-copy-id(){ copy_ssh_id_to_remote_machine $Args }
function mrm(){ remove_multi_files $Args }
function mrmr(){ remove_multi_files -Recurse $Args }
function mrmrf(){ remove_multi_files -Recurse -Force $Args }
function rmr(){ Remove-Item -Recurse $Args }
function rmrf(){ Remove-Item -Recurse -Force $Args }
function exp(){ Expand-Archive $Args }
function ec(){ Write-Output $Args }
function cpr(){ Copy-Item -Recurse $Args }
function touch(){ Out-File -InputObject "" -FilePath "$Args" }

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

function mp(){ multipass $Args }
function mpl(){ multipass list $Args }
function mpu(){ multipass start $Args }
function mpd(){ multipass stop $Args }
function mps(){ multipass shell $Args }
function mpc(){ multipass shell dev-vm $Args }

function wg(){ winget $Args }
function wgi(){ winget install $Args }
function wgl(){ winget list $Args }

# unset conflicted aliases
Remove-Alias ls

# key bindings
Import-Module PSReadline
Set-PSReadLineOption -EditMode Vi

# load local configuration
if(Test-Path $HOME/Documents/Powershell/profile_local.ps1){
    . $HOME/Documents/Powershell/profile_local.ps1
}
