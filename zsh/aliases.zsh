alias -g G='| grep'
alias -g E='2> /dev/null'
alias -g Z='> /dev/null'

alias l="ls --color=auto"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -al --color=auto"

alias ..="cd .."
alias ..2="cd_parent 2"
alias ..3="cd_parent 3"
alias cdg="cd-gitroot"

alias cl="clear"
alias cfg="cd ~/Config"

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias v="vim ."

alias gst="git status"
alias gl="git log"
alias glo="git log --oneline"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gs="git switch"
alias gsc="git switch -c"
alias gm="git merge"
alias gr="git reset"
alias gp="git push"
alias gpo="git push origin"
alias gpu="git pull"
alias gf="git fetch"
alias gcl="git clone"

alias kb="kubectl"
alias kbg="kubectl get"
alias kba="kubectl apply"

alias tf="terraform"
