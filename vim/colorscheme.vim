set t_Co=256
set background=dark

let s:iceberg_path = expand(g:vim_config_dir . "/colors/iceberg.vim")
if filereadable(s:iceberg_path)
    colorscheme iceberg
else
    let s:curl = has("win32") ? "curl.exe" : "curl"
    let s:iceberg_url = "https://raw.githubusercontent.com" . 
                \ "/cocopon/iceberg.vim/master/colors/iceberg.vim"
    let s:install_iceberg_command =
                \ printf("%s -flo %s --create-dirs %s", s:curl, s:iceberg_path, s:iceberg_url)
    let s:resp = system(s:install_iceberg_command)
    colorscheme iceberg
endif
