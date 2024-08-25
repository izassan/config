function install_zplug(){
    if [ ! -d $ZPLUG_HOME ];then
        echo "install zplug..."
        git clone https://github.com/zplug/zplug $ZPLUG_HOME
    else
        echo "zplug has already installed"
    fi
}

function change_repository(){
    cd $(ghq list --full-path | fzf)
}
