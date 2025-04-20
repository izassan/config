source $XDG_CONFIG_HOME/zsh/functions.zsh
source $XDG_CONFIG_HOME/zsh/prompt.zsh
source $XDG_CONFIG_HOME/zsh/aliases.zsh

if [ -d $ZPLUG_HOME ];then
    source $ZPLUG_HOME/init.zsh

    # plugins
    zplug "zsh-users/zsh-syntax-highlighting", defer:2
    zplug "zsh-users/zsh-autosuggestions"
    zplug "mollifier/cd-gitroot"

    # Then, source plugins and add commands to $PATH
    zplug load
fi

bindkey -v

zle -N change_repository change_repository
bindkey '^g' change_repository

autoload -U colors; colors
autoload -Uz add-zsh-hook

setopt share_history
setopt hist_ignore_all_dups
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt prompt_subst

function set_prompt(){
    PROMPT="%n %d > "
    RPROMPT="`set_right_prompt`"
}
add-zsh-hook precmd set_prompt

if [ -r $ZSH_LOCAL_CONFIG ];then
    source $ZSH_LOCAL_CONFIG
fi
