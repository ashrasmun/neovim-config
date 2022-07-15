require 'mappings'
require 'plugins'
require 'tools'

-- command! Scratch lua require'tools'.makeScratch()
vim.api.nvim_create_user_command('Scratch', "lua require'tools'.makeScratch()", {})

