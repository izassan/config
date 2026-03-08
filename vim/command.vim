function! CopyFileContent()
    let l:buffer_content = getbufline("", "1", "$")
    call setreg("+", l:buffer_content)
endfunction
command! -nargs=0 CopyFileContent :call CopyFileContent()

function! CreateMemo()
    let l:memo_dir = expand("$HOME/.memo")
    let l:memo_fname = input("filename: ")
    if l:memo_fname == ""
        return
    endif
    let l:memo_path = expand(l:memo_dir . "/" . l:memo_fname . ".memo")
    if !isdirectory(l:memo_dir)
        call mkdir(l:memo_dir)
    endif
    execute "split " . l:memo_path
endfunction
command! -nargs=0 CreateMemo :call CreateMemo()

function! OpenMemo()
    call fzf#run({'source': split(globpath(expand("$HOME/.memo"), "*.memo")), 'sink': 'split'})
endfunction
command! -nargs=0 OpenMemo :call OpenMemo()
