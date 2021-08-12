" This is an example of how _vimrc file should look on a Windows machine
" to make sure that one, common, configuration is kept under version
" control, is used.
" Source the init.vim from neovim-config repo

" Local vimrc file
let g:VIM_RC="h:\\dev\\neovim-config\\init.vim"

try
    exec "source " . g:VIM_RC
catch
    echom "Cannot find the Vim configuration file: " . g:VIM_RC
endtry
