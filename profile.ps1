# functions
function alias {
  Param($alias_name,$commands)
  if(-not ($alias_name -and $commands)){
    Write-Output "invalid argument"
  }
  $full_commands = "$commands `$args"
  if(Get-Alias $alias_name 2> $null){
    Remove-Alias -Force $alias_name
  }
  $null = New-Item -Force -Path function: -Name "script:$alias_name" -Value "$full_commands"
}

function ssh-copy-id ($ssh_access_point, $ssh_public_key = "$HOME\.ssh\id_rsa.pub"){
    $ssh_commands = "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
    Get-Content $ssh_public_key | ssh.exe $ssh_access_point $ssh_commands
}

function b64encode($str){
    if(!$str){
        return
    }
    $byte = ([System.Text.Encoding]::Default).GetBytes($str)
    $b64enc = [Convert]::ToBase64String($byte)
    echo $b64enc
}

function b64decode($b64_str){
    if(!$b64_str){
        return
    }
    $byte = [System.Convert]::FromBase64String($b64_str)
    $str = [System.Text.Encoding]::Default.GetString($byte)
    echo $str
}

function devvmstart($devvm_vmx_path = "$HOME\Documents\Virtual Machines\DevVM\DevVM.vmx"){
    vmrun.exe -T player start $devvm_vmx_path nogui
}
function devvmstop ($devvm_vmx_path = "$HOME\Documents\Virtual Machines\DevVM\DevVM.vmx"){
    vmrun.exe -T player start $devvm_vmx_path nogui
}

# path
$env:PATH = "$env:PATH;C:\Program Files (x86)\VMware\VMware Player\"

# aliases
## git
alias "gst" "git status"
alias "ga" "git add"
alias "gc" "git commit"
alias "gcm" "git commit -m"
alias "gs" "git switch"
alias "gsc" "git switch -c"
alias "gpl" "git pull"
alias "gps" "git push"
alias "gpso" "git push origin"
alias "gf" "git fetch"
alias "gm" "git merge"
alias "gb" "git branch"
alias "gl" "git log"
alias "gba" "git branch -a"
alias "gbd" "git branch -d"
alias "grp" "git remote prune"
alias "grpo" "git remote prune origin"
alias "gd" "git diff"
alias "gdc" "git diff --cached"
