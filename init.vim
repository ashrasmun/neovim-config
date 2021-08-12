" Force english inside Vim
language messages en

" Set leader key to space
:let mapleader = " "
:nnoremap <Space> <Nop>

" Quickly access this config file
if exists("g:VIM_RC")
    if has ('win32')
        noremap <silent> <Leader>v :execute 'edit!' g:VIM_RC<CR>:set number relativenumber<CR>:<ESC>
    endif
else
    echom "You need to set VIM_RC variable so that it points to this file"
endif

" Quickly source current file
:noremap <silent> <Leader>s :wa<CR>:exe "source " . g:VIM_RC<CR>

