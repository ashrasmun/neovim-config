" Basic miscellaneous that are hard to really categorize but it's impossible
" to work without them

" Force english inside Vim
language messages en

" Set leader key to space
:let mapleader = " "
:nnoremap <Space> <Nop>

if has ('win32')
    " Quickly access this config file
    noremap <silent> <Leader>v :execute 'edit!' g:VIM_RC<CR>:set number relativenumber<CR>:<ESC>
    
    " Quickly source current file
    noremap <silent> <Leader>s :wa<CR>:exe "source " . g:VIM_RC<CR>
endif


