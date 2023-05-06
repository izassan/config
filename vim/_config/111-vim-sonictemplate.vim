UsePlugin 'vim-sonictemplate'

let g:sonictemplate_vim_template_dir=[
    \ expand("$VIMUSERCONFIGDIR/_templates"),
    \ expand("$HOME/.dotfiles.local/vim/templates"),
\]

nnoremap [template] <Nop>
nmap <Space>t [template]

let g:atcoderQuestionID = 0
function! NextAtcoderQuestion()
    let l:filename = "question_" . g:atcoderQuestionID . ".cpp"
    execute ":tabnew " . l:filename
    Template atcoder
    let g:atcoderQuestionID += 1
endfunction
nnoremap [template]n :call NextAtcoderQuestion()<CR>
