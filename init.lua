require 'mappings'
require 'plugins'
require 'nerdtree'
require 'completion'
require 'tools'

local api = vim.api

-- command! Scratch lua require'tools'.makeScratch()
--api.nvim_create_user_command('Scratch', "lua require'tools'.makeScratch()", {})

-- Enable line numbering
vim.opt.number = true

-- Remove temporary files associated with working on a text file
vim.opt.undofile = false
vim.opt.swapfile = false

-- Fix tabs to be 4 space wide instead of 8
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Display trailing characters
vim.opt.listchars = 'tab:>-,trail:-,nbsp:_'
vim.opt.list = true

-- Fix backspace behaviour (probably not needed in neovim, but adding it just in case)
vim.opt.backspace = 'indent,eol,start'

vim.cmd([[ colorscheme jellybeans-nvim ]])

-- Enable mouse
vim.opt.mouse = 'a'
