function CopyAllContentToClipboard()
    let l:contents = getline(1, "$")
    call setreg('+', join(l:contents, "\n"))
endfunction
