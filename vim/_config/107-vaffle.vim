UsePlugin 'vaffle.vim'

let g:vaffle_auto_cd = 1
let g:vaffle_open_selected_split_position = 'rightbelow'
let g:vaffle_open_selected_vsplit_position = 'rightbelow'
augroup vaffleFold
    autocmd!
    autocmd FileType vaffle setlocal foldmethod=manual
augroup END

function s:set_vaffle_user_map()
    nmap <buffer> ss <Plug>(vaffle-open-selected-split)
    nmap <buffer> sv <Plug>(vaffle-open-selected-vsplit)
endfunction

augroup filetypemap
    autocmd!
    autocmd FileType vaffle call s:set_vaffle_user_map()
augroup END
