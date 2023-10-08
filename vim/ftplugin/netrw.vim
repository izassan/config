let g:netrw_banner=0
let g:netrw_sizestyle="H"
let g:netrw_liststyle=1
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview=1
let g:netrw_home=expand("$HOME")

nnoremap <buffer> s <Nop>
nnoremap <buffer> S :call <SNR>31_NetrwSortStyle(1)<CR>
nnoremap <buffer> sj <C-w>j
nnoremap <buffer> sk <C-w>k
nnoremap <buffer> sh <C-w>h
nnoremap <buffer> sl <C-w>l
