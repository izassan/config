[ -z $ZPLUG_HOME ] && ZPLUG_HOME="~/.config/zsh/zplug"

if [ ! -d $ZPLUG_HOME ];then
    echo "zplug not found. installing..."
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source $ZPLUG_HOME/init.zsh

# plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "mollifier/cd-gitroot"

# Then, source plugins and add commands to $PATH
zplug load
