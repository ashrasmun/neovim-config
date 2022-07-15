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

end)
