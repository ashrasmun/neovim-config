-- Requirements:
-- Icons for the explorer: https://www.nerdfonts.com/font-downloads -> Symbols Nerd Font

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- Toggle mini file explorer
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { desc = '[T]oggle File [T]ree' })
vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFileToggle<CR>', { desc = '[T]oggle Tree for [F]ound File' })
