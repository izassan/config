export LC_ALL=ja_JP.UTF-8
export LC_MESSAGES=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export DIRSTACKSIZE=50
export HISTFILESIZE=200000
export HISTSIZE=100000
export SAVEHIST=50000
export HISTFILE=$XDG_CONFIG_HOME/zsh/.zsh_history

export ZPLUG_HOME=$XDG_CONFIG_HOME/zsh/.zplug
export ZSH_LOCAL_CONFIG=$XDG_CONFIG_HOME/zsh/zshrc_local

export GOPATH="$XDG_DATA_HOME/go"
export PATH="$PATH:$GOPATH/bin:$HOME/.local/bin"
