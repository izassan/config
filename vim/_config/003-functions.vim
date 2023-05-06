function MarkdownPreview2Plantuml()
    let l:md_filename = expand("%")
    let l:pu_filename = substitute(l:md_filename, "md", "pu", "g")
    execute (&l:modified ? "split" : "edit") l:pu_filename
    let l:md_buffer = readfile(l:md_filename)
    let l:uml_flag = v:false
    for l:line in l:md_buffer
        if l:line == "```plantuml"
            let l:uml_flag = v:true
            call append(line('$'), "@startuml")
        elseif l:uml_flag && l:line == "```"
            let l:uml_flag = v:false
            call append(line('$'), "@enduml")
            call append(line('$'), "")
        elseif l:uml_flag
            call append(line('$'), l:line)
        endif
    endfor
    call deletebufline('%', 1)
endfunction

function CopyAllContentToClipboard()
    let l:contents = getline(1, "$")
    call setreg('+', join(l:contents, "\n"))
endfunction
