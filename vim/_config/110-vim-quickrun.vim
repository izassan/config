UsePlugin 'vim-quickrun'

let g:quickrun_config = {}

if has("win32")
    let g:quickrun_config.cpp = {'command': 'g++'}
endif

nnoremap <silent> [plugin]5 :QuickRun<CR>
nnoremap <silent> [plugin]6 :QuickRun -input =@+<CR>
