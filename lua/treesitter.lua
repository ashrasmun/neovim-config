local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end

configs.setup {
    ensure_installed = {'c', 'cpp', 'lua', 'zig', 'perl', 'toml', 'python', 'rust'},
    sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
    auto_install = true, -- Automatically install missing parsers when entering buffer
    highlight = {
        enable = true
        -- additional_vim_regex_highlighting = true
    }
}
