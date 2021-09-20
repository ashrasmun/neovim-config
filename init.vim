if !exists("g:VIM_RC")
    echom "You need to set VIM_RC variable so that it points to this file"
    finish
endif

let this_dir=fnamemodify(g:VIM_RC, ':h')

execute "source " . this_dir . "/details/basics.vim"
execute "source " . this_dir . "/details/trim_whitespaces.vim"

