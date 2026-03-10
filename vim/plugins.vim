" lightline.vim
let g:lightline = {
\   'colorscheme': 'wombat',
\}


" vim-lsp
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0

" asyncomplete.vim
let g:asyncomplete_auto_completeopt=0
set completeopt=menuone,noinsert,noselect,preview


" vim-sonictemplate
let g:sonictemplate_vim_template_dir = [
\   expand(g:vim_config_dir . "/templates"),
\   expand(g:vim_config_dir . "/templates_local"),
\]


" vaffle.vim
let g:vaffle_auto_cd=1
let g:vaffle_open_selected_split_position='rightbelow'
let g:vaffle_open_selected_vsplit_position='rightbelow'


" ultisnips
let g:UltiSnipsEnableSnipMate=0
let g:UltiSnipsSnippetDirectories = [
\   expand(g:vim_config_dir . "/plugged/vim-snippets/UltiSnips"),
\   expand(g:vim_config_dir . "/codesnippets"),
\   expand(g:vim_config_dir . "/codesnippets_local")
\]

if has('python3')
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif


" netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
