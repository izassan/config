function CopyAllContentToClipboard()
    let l:contents = getline(1, "$")
    call setreg('+', join(l:contents, "\n"))
endfunction

let s:plugin_manager_name = "vim-plug"
let s:github_raw_uri = "https://raw.githubusercontent.com"
if has("win32")
    let s:curl_command = "curl.exe --create-dirs -fLo"
else
    let s:curl_command = "curl --create-dirs -fLo"
endif

function InstallPluginManager()
    let l:dl_path = "/junegunn/vim-plug/master/plug.vim"
    let l:dl_url = s:github_raw_uri . l:dl_path
    let l:dest_path = expand("$VIMUSERCONFIGDIR/autoload/plug.vim")
    if filereadable(l:dest_path)
        echo s:plugin_manager_name "has already installed"
        return
    endif
    echo "Installing" s:plugin_manager_name "..."
    let l:commands = join([s:curl_command, l:dest_path, l:dl_url], " ")
    call system(l:commands)
    echo s:plugin_manager_name "installed!"
endfunction

function InstallColorschemes()
    let l:dl_path = "/jonathanfilip/vim-lucius/master/colors/lucius.vim"
    let l:dl_url = s:github_raw_uri . l:dl_path
    let l:dest_path = expand("$VIMUSERCONFIGDIR/colors/lucius.vim")
    if filereadable(l:dest_path)
        echo "colorschemes has already installed"
        return
    endif
    echo "Instaling colorschemes..."
    let l:commands = join([s:curl_command, l:dest_path, l:dl_url], " ")
    call system(l:commands)
    echo "Colorschemes installed!"
endfunction
