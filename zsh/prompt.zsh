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

function set_left_prompt(){
    result=$?
    rules="`ghq root`=#GHQROOT;$HOME=~"
    dir="%F{39} `extpwd -r $rules`%f"
    arrow=" > "
    if [ $result -ne 0 ];then
        arrow="%F{9} > %f"
    fi
    echo "$dir$arrow"
}

function set_right_prompt(){
    git="%F{11}`git_prompt`%f"
    echo "$git"
}
