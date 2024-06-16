function install_zplug(){
    if [ ! -d $ZPLUG_HOME ];then
        echo "install zplug..."
        git clone https://github.com/zplug/zplug $ZPLUG_HOME
    else
        echo "zplug has already installed"
    fi
}

function git_prompt(){
    if ! {type git > /dev/null 2>&1}; then
        return
    fi
    branch=`git symbolic-ref --short HEAD 2> /dev/null`
    gitstatus=`git status --short 2> /dev/null`
    gitstatusicon=""
    gitstaged=""

    if [[ -n `echo "$gitstatus" | grep -E ".M"` ]];then
        gitstatusicon="${gitstatusicon}M"
    fi
    if [[ -n `echo "$gitstatus" | grep -E ".D"` ]];then
        gitstatusicon="${gitstatusicon}D"
    fi
    if [[ -n `echo "$gitstatus" | grep "??"` ]];then
        gitstatusicon="${gitstatusicon}U"
    fi
    if [[ -n `echo "$gitstatus" | grep "^\(A\|M\|D\)"` ]];then
        gitstaged="Staged"
    fi

    if [ -z $branch ];then
        return
    fi
    
    gitprompt="$branch"
    if [ -n "$gitstatusicon" ];then
        gitprompt="${gitprompt}+${gitstatusicon}"
    fi
    if [ -n "$gitstaged" ];then
        gitprompt="${gitprompt} + ${gitstaged}"
    fi
    echo $gitprompt
}

function echo_prompt(){
    echo "%n %~ `git_prompt`\n-> "
}
