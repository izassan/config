command! -nargs=0 CdRepo call fzf#run({
\    'source': 'ghq list --full-path',
\    'sink': 'cd'
\})

function! CreateRepository(repo_name)
    call system("ghq create " . a:repo_name)
endfunction
command! -nargs=1 MkRepo call CreateRepository(<f-args>)
