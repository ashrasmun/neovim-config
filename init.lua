-- Remember to :checkhealth in order to repair stuff that needs to be addressed
-- on each machine manually. For extended explanation please read README.md

require('mappings')
require('plugins')
require('lsp') -- needs to be after 'plugins'
require('treesitter') -- needs to be after 'plugins'
require('nerdtree') -- needs to be after 'plugins'
require('completion')
require('ginit')

local api = vim.api

-- command! Scratch lua require'tools'.makeScratch()
api.nvim_create_user_command('Scratch', "lua require'tools'.makeScratch()", {})

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

-- NOTE: It is possible, that treesitter can get confused on this line (first
-- one on which you are going to notice it btw). The reason is most probably
-- related to the fact that treesitter doesn't know which parser to use. You
-- just need to rename the one 'nvim' uses natively. For better context please
-- check:
-- https://www.reddit.com/r/neovim/comments/z9008g/nvimtreesitter_invalid_node_type_at_position_5/
vim.cmd([[ colorscheme jellybeans-nvim ]])
-- vim.cmd([[ colorscheme gotham ]])

-- Enable mouse
vim.opt.mouse = 'a'

-- If searching in lowercase, ignore casing. Otherwise, check for a specific
-- string and take font case into consideration. Also remove highlight on
-- search.
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.textwidth = 80

-- Trim whole file from trailing whitespaces
vim.cmd([[
function! s:TrimTrailingWhitespaces() range
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

:noremap <silent> <Leader>fw :call <SID>TrimTrailingWhitespaces()<CR>
]])

-- TODO: Make it aware of what type of file is being editted at the moment and
-- add old formatting commands.
-- command! FormatXML :%!python -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
-- command! FormatJSON :%!python -m json.tool
vim.cmd([[:nnoremap <silent> <Leader>fe <cmd>lua require('stylua').format()<CR>]])

-- Workaround because Lsp is intrusive out-of-the-box. Ideally I would like to
-- have these signs disabled, but I don't know how to.
-- Link for future: https://github.com/neovim/nvim-lspconfig/issues/195
vim.opt.signcolumn = 'number'


-- vim.g.rustfmt_command = "C:\\Users\\ashra\\.cargo\\bin\\rustfmt.exe"
vim.g.rustfmt_autosave = 1

-- Automatically change working directory when accessing a file. This improves
-- the usability of Telescope, as it enabled grep from directory in which the
-- currently edited file lives.
vim.cmd([[:set autochdir]])
