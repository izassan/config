# global aliases
alias -g G='| grep'
alias -g E='2> /dev/null'
alias -g Z='> /dev/null'

# ls
alias l="ls --color=auto"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -al --color=auto"

# cd
alias ..="cd .."
alias ..2="cd_parent 2"
alias ..3="cd_parent 3"
alias cdg="cd-gitroot"

# safe commands
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# vim
alias vi="vim"
alias ve="vim ."
alias memo="vim -c TakeMemo"

# git
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

# apt
alias aptup="sudo apt update && sudo apt upgrade -y"
alias apti="sudo apt install -y"
alias aptar="sudo apt autoremove"

# python
alias py="python3"
alias python="python3"

# podman
alias pd="podman"
alias spd="sudo podman"

# golang
alias goinit="go mod init"
alias gorun="go run ./*.go"
alias gobld="go build ./*.go"
alias gog="go get"
alias goi="go install"

# spring
alias sbmvc="spring init --build=gradle --dependencies=web,h2,data-jpa,lombok"
alias sbndb="spring init --build=gradle --dependencies=web,lombok"

# other
alias cl="clear"
