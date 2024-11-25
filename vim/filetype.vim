augroup memo_custom_filetype
    autocmd BufNewFile,BufRead *.memo setfiletype memo
    autocmd BufNewFile,BufRead *.memo runtime! syntax/markdown.vim
augroup END
