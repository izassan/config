New-Item -ItemType SymbolicLink -Path $HOME\Documents -Name Powershell -Value $PWD\powershell
New-Item -ItemType SymbolicLink -Path $HOME -Name vimfiles -Value $PWD\vim

New-Item -ItemType Directory -Path $HOME -Name .config
New-Item -ItemType SymbolicLink -Path $HOME\.config -Name git -Value $PWD\git
