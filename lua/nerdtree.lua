-- Close vim when NERDTree buffer is the only one present
-- In case of emergency, visit:
-- https://stackoverflow.com/questions/2066590/automatically-quit-vim-if-nerdtree-is-last-and-only-buffer
-- vim.cmd([[autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif]])

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

-- Toggle mini file explorer
vim.cmd([[noremap <Leader>nt :NvimTreeOpen<CR>]])
-- vim.cmd([[noremap <Leader>nf :NERDTreeFind<CR>]])
