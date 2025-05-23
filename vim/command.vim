command! -nargs=0 CdRepo call fzf#run({
\    'source': 'ghq list --full-path',
\    'sink': 'cd'
\})

function! CreateRepository(repo_name)
    call system("ghq create " . a:repo_name)
endfunction
command! -nargs=1 MkRepo call CreateRepository(<f-args>)

command! -nargs=0 ConfigInit :call ConfigInit()
command! -nargs=0 CopyFileContent :call CopyFileContent()

command! -nargs=0 CreateMemo :call CreateMemo()
command! -nargs=0 OpenMemo :call OpenMemo()
