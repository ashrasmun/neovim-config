local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- nvim-surround
    {
        'kylechui/nvim-surround',
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- treesitter
    -- Please remember to check:
    -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },

    'neovim/nvim-lspconfig',
    'nvim-lua/lsp_extensions.nvim',
    'onsails/lspkind.nvim',

    -- Autocompletion framework
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/vim-vsnip',

    -- To enable more of the features of rust-analyzer, such as inlay hints and more!
    'simrat39/rust-tools.nvim',

    -- Override native rust plugin with newest one
    -- https://danmc.net/posts/nvim-rust-1/
    'rust-lang/rust.vim',

    -- My favorite colorscheme :)
    'rktjmp/lush.nvim',
    'metalelf0/jellybeans-nvim',

    'easymotion/vim-easymotion',
    'scrooloose/nerdtree',
})
