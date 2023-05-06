UsePlugin 'fzf'
UsePlugin 'fzf.vim'

nnoremap [plugin]f :Files<CR>
nnoremap [plugin]g :GFiles<CR>
nnoremap [plugin]rr :ChangeRepository<CR>
nnoremap [plugin]re :ChangeRepositoryEdit<CR>
nnoremap [plugin]cdd :ChangeDirectory<CR>
nnoremap [plugin]cde :ChangeDirectoryEdit<CR>

if executable("ghq")
command! -nargs=0 ChangeRepository call fzf#run({
\   'source': 'ghq list --full-path',
\   'sink' : 'cd'
\ })

command! -nargs=0 ChangeRepositoryEdit call fzf#run({
\   'source': 'ghq list --full-path',
\   'sink' : 'edit'
\ })
endif



if has("python3")

py3 << EOS
import vim
import os
import re
def tree(current = "."):
    tree = []
    exclude = '\./(.*/)*(\.git|node_modules)'
    patter = re.compile(exclude)

    for root, _, _ in os.walk(current):
        if root == ".": continue
        if re.match(patter, root):
            continue
        tree.append(root)
    return "\n".join(tree)
EOS

function! s:changedir()
    py3 vim.command("call fzf#run({'source': 'echo \""+tree()+"\"','sink': 'cd' })")
endfunction

function! s:changediredit()
    py3 vim.command("call fzf#run({'source': 'echo \""+tree()+"\"','sink': 'edit'})")
endfunction


command! -nargs=0 ChangeDirectory call s:changedir()
command! -nargs=0 ChangeDirectoryEdit call s:changediredit()
endif

