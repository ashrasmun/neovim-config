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
local status_ok, packer = pcall(require, "packer")
    if not status_ok then
    return
end

return require('packer').startup(function()
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
    use 'nvim-treesitter/nvim-treesitter'
    use 'tree-sitter/tree-sitter-rust'

    -- Collection of common configurations for the Nvim LSP client
    use 'neovim/nvim-lspconfig'

    -- Extentions to built-in LSP, for example, providing type inlay hints
    use 'nvim-lua/lsp_extensions.nvim'

    -- Autocompletion framework
    use 'hrsh7th/nvim-cmp'
    -- cmp LSP completion
    use 'hrsh7th/cmp-nvim-lsp'
    -- cmp Snippet completion
    use 'hrsh7th/cmp-vsnip'
    -- cmp Path completion
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    -- See hrsh7th other plugins for more great completion sources!

    -- Snippet engine
    use 'hrsh7th/vim-vsnip'

    -- My favorite colorscheme :)
    use 'nanotech/jellybeans.vim'
end)
