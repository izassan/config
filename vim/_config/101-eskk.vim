UsePlugin 'eskk.vim'

set imdisable

imap jk <Plug>(eskk:toggle)
cmap jk <Plug>(eskk:toggle)

let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "/usr/share/skk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
let g:eskk#kakutei_when_unique_candidate = 1
let g:eskk#no_default_mappings = 0
let g:eskk#keep_state = 0
let g:eskk#egg_like_newline = 1
let g:eskk#enable_completion = 1
