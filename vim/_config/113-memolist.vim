UsePlugin 'memolist.vim'

let g:memolist_path = "$HOME/.memo"
if executable("fzf")
    let g:memolist_fzf = 1
endif

nnoremap [plugin]mn  :MemoNew<CR>
nnoremap [plugin]ml  :MemoList<CR>
nnoremap [plugin]mg  :MemoGrep<CR>
