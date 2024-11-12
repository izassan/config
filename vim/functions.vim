function! ConfigInit()
    let l:curl = has("win32") ? "curl.exe" : "curl"
    " Install Plugin Manager(vim-plug)
    let l:vimplug_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    let l:install_vimplug_command = printf("%s -flo %s --create-dirs %s", l:curl, GetVimPlugPath(), l:vimplug_url)
    if !IsReadableVimPlugPath()
        let l:resp = system(l:install_vimplug_command)
    else
        echo "vim-plug has already installed. skipped"
    endif

    " Install Colorscheme(iceberg.vim)
    let l:iceberg_url = "https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim"
    let l:install_iceberg_command = printf("%s -flo %s --create-dirs %s", l:curl, GetIcebergPath(), l:iceberg_url)
    if !filereadable(GetIcebergPath())
        let l:resp = system(l:install_iceberg_command)
    else
        echo "iceberg colorscheme has already installed. skipped"
    endif
    echo "config initilization successed"
endfunction

function! CopyFileContent()
    let l:buffer_content = getbufline("", "1", "$")
    call setreg("+", l:buffer_content)
endfunction

function! GetVimConfigDir()
    if has("win32")
        return expand("$HOME/vimfiles") 
    else
        return expand("$HOME/.vim")        
    endif
endfunction

function! GetVimPlugPath()
    return expand(GetVimConfigDir() . "/autoload/plug.vim")
endfunction

function! IsReadableVimPlugPath()
    if filereadable(GetVimPlugPath())
        return v:true
    endif
    return v:false
endfunction

function! GetIcebergPath()
    return expand(GetVimConfigDir() . "/colors/iceberg.vim")
endfunction
