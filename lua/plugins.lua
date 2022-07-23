-- NOTE: It's important to run sync before using any plugin, or they may not work (happened with nvim-surround)

-- Thanks to:
-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/plugins.lua

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim" if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "packer")
    if not status_ok then
    return
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- nvim-surround
    use {
        "kylechui/nvim-surround",
        config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
        end
    }

    -- treesitter
    -- Please remember to check:
    -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate rust python toml lua zig c cpp perl"
    }

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'onsails/lspkind.nvim'

    -- Autocompletion framework
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    -- To enable more of the features of rust-analyzer, such as inlay hints and more!
    use 'simrat39/rust-tools.nvim'

    -- My favorite colorscheme :)
    use 'rktjmp/lush.nvim'
    use 'metalelf0/jellybeans-nvim'

    -- Fuzzy finder
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'easymotion/vim-easymotion'
    use 'scrooloose/nerdtree'

    -- Lua code formatter
    use {
        'ckipp01/stylua-nvim',
        run = 'cargo install stylua'
    }
end)

