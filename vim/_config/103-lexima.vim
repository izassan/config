UsePlugin 'lexima.vim'

let s:ft_around_js = [
\ 'javascript', 'typescript',
\ 'javascriptreact', 'typescriptreact',
\]
let s:rules = [
\ {'filetype': s:ft_around_js, 'char': '=>', 'at': '(.*)\%#', 'input': ' => {}<Left>'} ,
\ {'filetype': s:ft_around_js, 'char': '=>', 'at': '(.*\%#)', 'input': ' => {}<Left>', 'leave': 1},
\]

for s:rule in s:rules
    call lexima#add_rule(s:rule)
endfor
