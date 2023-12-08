local api = vim.api
local M = {}

-- Parameters
-- ----------
-- mode
--  as in vim modes like normal/insert mode
-- lhs
--  the custom keybings you need
-- rhs
--  the commands or existing keybinds to customise
-- opts
--  additional options like <silent>/<noremap>, see :h map-arguments for
--  more info on it
-- Thanks to:
-- https://blog.devgenius.io/create-custom-keymaps-in-neovim-with-lua-d1167de0f2c2
function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader
vim.g.mapleader = ' '
M.map('', ' ', '<Nop>')

-- Source
M.map('n', '<Leader>s', ':wa<CR>:exe "source %"<CR>', { silent = true })
M.map('n', '<Leader>v', ':e $MYVIMRC<CR>', { silent = true })

-- Movement between panes
M.map('', '<C-h>', '<C-w>h')
M.map('', '<C-j>', '<C-w>j')
M.map('', '<C-k>', '<C-w>k')
M.map('', '<C-l>', '<C-w>l')

-- Remove highlight
-- M.map('n', '<Leader>/', ':nohl<CR>')

-- Fix Shift-Insert
M.map('i', '<S-Insert>', '<C-R>+', { silent = true })

-- Telescope
M.map('n', '<Leader>tf', "<cmd>lua require('telescope.builtin').find_files()<CR>")
M.map('n', '<Leader>tg', "<cmd>lua require('telescope.builtin').live_grep({grep_open_files = true})<CR>")
M.map('n', '<Leader>tr', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
M.map('n', '<Leader>ts', "<cmd>lua require('telescope.builtin').grep_string()<CR>")
M.map('n', '<Leader>tb', "<cmd>lua require('telescope.builtin').buffers()<CR>")
M.map('n', '<Leader>th', "<cmd>lua require('telescope.builtin').help_tags()<CR>")

M.map('', '<S-F11>', "<cmd>:GonvimFullscreen 0<CR>")
M.map('', '<F11>', "<cmd>:GonvimFullscreen 1<CR>")

return M
