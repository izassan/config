" Disable Default Keymapping
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>


" General
let g:mapleader = "\<space>"
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap <C-h> :nohlsearch<CR>
nnoremap <C-c> :CopyFileContent<CR>
nnoremap <Leader>je :e .<CR>
nnoremap <Leader>t :terminal ++close<CR>
nnoremap <Leader>T :terminal ++curwin ++close<CR>

inoremap jj <ESC>


" LSP
noremap [LSP] <Nop>
nmap <Leader>l [LSP]

nnoremap [LSP]r :LspRename<CR>
nnoremap [LSP]a :LspCodeAction<CR>
nnoremap [LSP]d :LspDocumentDiagnostics<CR>


" Memo
noremap [Memo] <Nop>
nmap <Leader>m [Memo]

nnoremap [Memo]c :CreateMemo<CR>
nnoremap [Memo]o :OpenMemo<CR>
