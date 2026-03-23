[ -r ~/.config/zsh/zshrc_local_before.zsh ] && source ~/.config/zsh/zshrc_local_before.zsh

source $XDG_CONFIG_HOME/zsh/functions.zsh
source $XDG_CONFIG_HOME/zsh/zplug.zsh

bindkey -v

zle -N change_repository change_repository
bindkey '^g' change_repository

autoload -U colors; colors
autoload -Uz add-zsh-hook

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt prompt_subst
setopt appendhistory
setopt share_history
setopt hist_ignore_all_dups
setopt inc_append_history
setopt extended_history

# configuration prompt with startship
type starship > /dev/null && eval "$(starship init zsh)"

# configuration alias with maskcmd
source $XDG_CONFIG_HOME/zsh/alias.zsh

[ -r ~/.config/zsh/zshrc_local_after.zsh ] && source ~/.config/zsh/zshrc_local_after.zsh
