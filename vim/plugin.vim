" Plugin manage
if !IsReadableVimPlugPath()
    finish
endif

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'cocopon/vaffle.vim'
Plug 'machakann/vim-sandwich'
Plug 'cohama/lexima.vim'
Plug 'mattn/vim-sonictemplate'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'mattn/vim-maketable'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'hashivim/vim-terraform' , { 'for': 'terraform'}

if has('python3')
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
endif

if executable("fzf")
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
endif
call plug#end()


" Plugin configuration (netrw)
let g:netrw_banner=0
let g:netrw_sizestyle="H"
let g:netrw_liststyle=1
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview=1
let g:netrw_home=expand("$HOME")

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1


" Plugin configuration (lightline.vim)
let g:lightline = {
\   'colorscheme': 'wombat',
\}


" Plugin configuration (vim-lsp)
let g:lsp_diagnostics_echo_cursor=1

" for debug
" let g:lsp_log_file = expand('~/vim-lsp.log')


" Plugin configuration (vim-lsp-settings)
if has("win32")
    let g:lsp_settings = {
    \   'powershell-languageserver': {
    \       'cmd': [ expand(GetVimConfigDir() . '/scripts/powershell-core-languageserver.cmd') ],
    \   },
    \}
endif


" Plugin configuration (asyncomplete.vim)
let g:asyncomplete_auto_completeopt=0
set completeopt=menuone,noinsert,noselect,preview


" Plugin configuration (vim-sonictemplate)
let g:sonictemplate_vim_template_dir = [
\    expand(GetVimConfigDir() . "/templates"),
\    expand("$HOME/local_config/vim/templates"),
\]


" Plugin configuration (vaffle.vim)
let g:vaffle_auto_cd=1
let g:vaffle_force_delete=1
let g:vaffle_open_selected_split_position='rightbelow'
let g:vaffle_open_selected_vsplit_position='rightbelow'


" Plugin configuration (ultisnips)
let g:UltiSnipsEnableSnipMate=0
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = expand(GetVimConfigDir() . "/snips/common")
let g:UltiSnipsSnippetDirectories = [
\    expand(GetVimConfigDir() . "/snips/common"),
\    expand("$HOME/local_config/vim/snips/common")
\]

if has('python3')
    let g:UltiSnipsExpandTrigger="<Tab>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif

