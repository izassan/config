augroup memo_filetype
    autocmd BufNewFile,BufRead *.memo setfiletype memo
    autocmd BufNewFile,BufRead *.memo runtime! syntax/markdown.vim
augroup END

augroup terraform_filetype
    autocmd BufNewFile,BufRead *.tf setlocal tabstop=2
    autocmd BufNewFile,BufRead *.tf setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.tf setlocal shiftwidth=2
augroup END
