New-Item -ItemType SymbolicLink -Path $HOME\Documents -Name Powershell -Value $PWD\powershell
New-Item -ItemType SymbolicLink -Path $HOME -Name vimfiles -Value $PWD\vim
New-Item -ItemType SymbolicLink -Path $HOME -Name .gitconfig -Value $PWD\.gitconfig
