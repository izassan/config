export ZDOTDIR=$HOME/.zsh
export ZPLUG_HOME=~/.zsh/.zplug
export PAGER=less
export SHELL=/usr/bin/zsh
export EDITOR=/usr/bin/vim
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTFILE=~/.bash_history
export LC_ALL=ja_JP.UTF-8
export LC_MESSAGES=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

export GOPATH=$HOME/.go
export PYTHONUSERBASE=$HOME/.local
export PATH=$PATH:$GOPATH/bin:$PYTHONUSERBASE/bin

if [ -e $ZDOTDIR/.zshenv ];then
    source $ZDOTDIR/.zshenv
fi
