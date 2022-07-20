-- Invoke nerd tree every time vim is opened
-- and focus on buffer with file
vim.cmd([[autocmd VimEnter * NERDTree | wincmd w]])

-- Close vim when NERDTree buffer is the only one present
-- In case of emergency, visit:
-- https://stackoverflow.com/questions/2066590/automatically-quit-vim-if-nerdtree-is-last-and-only-buffer
vim.cmd([[autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif]])

-- Toggle mini file explorer
vim.cmd([[noremap <Leader>nt :NERDTreeToggle<CR>]])
vim.cmd([[noremap <Leader>nf :NERDTreeFind<CR>]])
