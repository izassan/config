UsePlugin 'vim-operator-user'
UsePlugin 'vim-operator-convert-case'

nnoremap [operator] <Nop>
nmap <Space>o [operator]

nmap [operator]c [op-case]
nmap [op-case]s <Plug>(operator-convert-case-toggle-upper-lower)
nmap [op-case]l <Plug>(operator-convert-case-loop)
nmap [op-case]nu <Plug>(operator-convert-case-upper-snake)
nmap [op-case]nl <Plug>operator-convert-case-lower-snake)
nmap [op-case]cu <Plug>(operator-convert-case-upper-camel)
nmap [op-case]cl <Plug>(operator-convert-case-lower-camel)
