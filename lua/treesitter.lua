local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end

configs.setup({
    -- First five are needed as per documentation
    -- https://github.com/nvim-treesitter/nvim-treesitter#modules
    ensure_installed = {
        "cpp",
        "json",
        "lua",
        "markdown",
        "perl",
        "python",
        "toml",
        "vim",
        "vimdoc",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,
        -- Can be demanding for the editor, but... the colors!
        -- additional_vim_regex_highlighting = true,
    },
})
