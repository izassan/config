function change_repository(){
    cd $(ghq list --full-path | fzf)
}
