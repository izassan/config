UsePlugin 'vim-lsp'

let s:enabled_lsp_log = v:false
if s:enabled_lsp_log
    let g:lsp_log_file = expand('~/lsp.log')
endif
let g:lsp_highlights_enabled = 0
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_settings = {
\    'clangd': {
\        'cmd':['clangd'],
\     },
\    'efm-langserver': {
\        'disabled': 0,
\        'allowlist': ['markdown'],
\    }
\}

nnoremap [LSP] <Nop>
nmap <Space>l [LSP]

nnoremap <silent> [LSP]a :LspCodeAction<CR>
nnoremap <silent> [LSP]j :LspDefinition<CR>
nnoremap <silent> [LSP]d :LspPeekDefinition<CR>
nnoremap <silent> [LSP]f :LspDocumentFormatSync<CR>
nnoremap <silent> [LSP]c :LspDocumentDiagnostics<CR>
nnoremap <silent> [LSP]n :LspNextError<CR>
nnoremap <silent> [LSP]b :LspPreviousError<CR>
nnoremap <silent> [LSP]r :LspRename<CR>
