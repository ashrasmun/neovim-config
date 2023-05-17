local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end

configs.setup({
    -- First five are needed as per documentation
    -- https://github.com/nvim-treesitter/nvim-treesitter#modules
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "zig", "perl", "toml", "python", "rust" },
    sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
    auto_install = true, -- Automatically install missing parsers when entering buffer

    -- TEMP(ashra, 2023-05-17): This doesn't work :/ It spews out some errors
    -- about internal stuff...
    -- highlight = {
    --     enable = true,
    --     -- Disable slow treesitter highlight for large files
    --     disable = function(lang, buf)
    --         local max_filesize = 100 * 1024 -- 100 KB
    --         local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --         if ok and stats and stats.size > max_filesize then
    --             return true
    --         end
    --     end,
    -- },
})
