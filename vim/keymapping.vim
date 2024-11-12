" Key mapping
nnoremap <Space> <Nop>
nnoremap <Space>je :e .<CR>
nnoremap + <C-a>
nnoremap - <C-x>
inoremap jj <ESC>
nnoremap Y y$
nnoremap <C-h> :nohlsearch<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap <C-c> :CopyFileContent<CR>
let g:use_shell = has("win32") ? "pwsh" : "zsh"
nnoremap <Space>t :execute("terminal ++close " . g:use_shell)<CR>
nnoremap <Space>T :execute("terminal ++curwin ++close " . g:use_shell)<CR>


" Plugin manage
if !IsReadableVimPlugPath()
    finish
endif

nnoremap [LSP] <Nop>
nmap <Space>l [LSP]

nnoremap [LSP]r :LspRename<CR>
nnoremap [LSP]a :LspCodeAction<CR>

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
