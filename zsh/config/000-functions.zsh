function cd_parent(){
    if [[ ! $1 =~ "^[0-9]+$" ]];then
        echo "argument is only number"
        return 1
    fi
    CD_DIR="./"
    for ((i=1; i<=$1; i++));do
        CD_DIR="$CD_DIR/../"
    done
    cd $CD_DIR
}

function change_repository(){
    if ! ( (( ${+commands[ghq]} )) || (( ${+commands[fzf]} )) ); then
        return
    fi
    to_repo=$(ghq list -p | fzf)
    if $to_repo;then
        cd $to_repo
    fi
    zle .reset-prompt
}

function install_zplug(){
    if [ ! -d $ZPLUG_HOME ];then
        echo "install zplug..."
        git clone https://github.com/zplug/zplug $ZPLUG_HOME
    else
        echo "zplug has already installed"
    fi
}

function intractive_ssh(){
    SSH_CONFIG=$HOME/.ssh/config
    if ! ( (( ${+commands[ssh]} )) || (( ${+commands[fzf]} )) ); then
        return
    fi
    hosts=()
    for i in `grep "^Host " $SSH_CONFIG | sed s/"^Host "//`
    do
        hosts=($hosts $i)
    done
    ssh_destination=$(echo -e ${(j:\n:)hosts} | fzf)
    ssh $ssh_destination
}
