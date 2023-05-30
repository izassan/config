UsePlugin 'ultisnips'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories = [
    \ expand("$VIMUSERCONFIGDIR/_snippets"),
    \ expand("$HOME/.dotfiles.local/vim/snippets"),
\]
