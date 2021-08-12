" Force english inside Vim
language messages en

" Set leader key to space
:let mapleader = " "
:nnoremap <Space> <Nop>

if exists("g:VIM_RC")
    if has ('win32')
	" Quickly access this config file
        noremap <silent> <Leader>v :execute 'edit!' g:VIM_RC<CR>:set number relativenumber<CR>:<ESC>

	" Quickly source current file
	noremap <silent> <Leader>s :wa<CR>:exe "source " . g:VIM_RC<CR>
    endif
else
    echom "You need to set VIM_RC variable so that it points to this file"
endif

