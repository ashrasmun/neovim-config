-- Close vim when NERDTree buffer is the only one present
-- In case of emergency, visit:
-- https://stackoverflow.com/questions/2066590/automatically-quit-vim-if-nerdtree-is-last-and-only-buffer
-- vim.cmd([[autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif]])

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make it so that opening NvimTree results in showing the contents of current
-- working directory
vim.g.nvim_tree_respect_buf_cwd = 1

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

-- Solving issue where NvimTree is the last buffer available and I just want to
-- exit Nvim in such case.
-- https://github.com/nvim-tree/nvim-tree.lua/issues/1368#issuecomment-1195557960
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})

-- Toggle mini file explorer
vim.cmd([[noremap <Leader>nt :NvimTreeOpen<CR>]])
-- vim.cmd([[noremap <Leader>nf :NERDTreeFind<CR>]])
