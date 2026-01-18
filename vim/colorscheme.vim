set t_Co=256
set background=dark

function! GetIcebergPath()
    return expand(GetVimConfigDir() . "/colors/iceberg.vim")
endfunction

if !filereadable(GetIcebergPath())
    let s:curl = has("win32") ? "curl.exe" : "curl"
    let s:iceberg_url = "https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim"
    let s:install_iceberg_command = printf("%s -flo %s --create-dirs %s", s:curl, GetIcebergPath(), s:iceberg_url)
    let s:resp = system(s:install_iceberg_command)
endif

if filereadable(GetIcebergPath())
    colorscheme iceberg
endif
