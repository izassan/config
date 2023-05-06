UsePlugin 'ultisnips'

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger="<c-x>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories = [
    \ expand("$VIMUSERCONFIGDIR/_snippets"),
    \ expand("$HOME/.dotfiles.local/vim/snippets"),
\]
