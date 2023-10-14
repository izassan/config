NEWLINE=$'\n'
#end color
FG="%F"
EFG="%f"
BG="%K"
EBG="%k"
RED="{red}"
BLUE="{blue}"
YELLOW="{yellow}"
GREEN="{green}"
BLACK="{black}"
WHITE="{white}"

function echo_left_prompt(){
    HOST="${FG}${BLACK}${BG}${GREEN} %n ${EBG}${EFG}"
    DIR="${FG}${WHITE}${BG}${BLUE} $(echo_pwd) ${EBG}${EFG}"
    ALLOW=$(echo_allow_part)
    GIT_INFO=$(echo_git_info)
    echo "${HOST}${DIR} ${GIT_INFO}${NEWLINE}${ALLOW} "
}

function echo_allow_part(){
    if [[ $command_result -eq 0 ]];then
        echo "${FG}${WHITE}->${EFG}"
    else
        echo "${FG}${RED}->${EFG}"
    fi
}

function echo_pwd(){
    echo ${PWD/\/home\/$USER/〜}
}

function echo_git_info(){
    if [[ $vcs_info_msg_0_  = "" ]];then
        echo ""
        return
    fi
    BRANCH=${vcs_info_msg_0_%%:*}
    STATUS=${vcs_info_msg_0_#*:}
    ACTION_STATUS=${vcs_info_msg_0_##*:}
    if [[ $STATUS = "stagedchanged" ]];then
        STATUSCHAR="${FG}${YELLOW}+mixed${EFG}"
    elif [[ $STATUS = "changed" ]];then
        STATUSCHAR="${FG}${YELLOW}+changed${EFG}"
    elif [[ $STATUS = "staged" ]];then
        STATUSCHAR="${FG}${GREEN}!staged${EFG}"
    elif [[ $STATUS = "action" ]];then
        STATUSCHAR="${FG}${GREEN}?action:${ACTION_STATUS}${EFG}"
    fi
    echo "${FG}${GREEN}[${BRANCH}]${EFG}${STATUSCHAR}"
}
