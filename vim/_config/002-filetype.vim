augroup assign_filetype
    autocmd!
    autocmd BufNewFile,BufRead tsconfig.json setlocal ft=json.jsonc
augroup END

augroup config_each_filetype
    autocmd!
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2
    autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2
    autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2
    autocmd FileType vue setlocal ts=2 sts=2 sw=2
augroup END

" augroup share_filetype
"     autocmd!
"     autocmd FileType javascriptreact setlocal filetype=javascriptreact.javascript
"     autocmd FileType typescriptreact setlocal filetype=typescriptreact.typescript
" augroup END
