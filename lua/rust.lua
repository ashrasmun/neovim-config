-- To setup the server, you need to do a bit of additional manual work.
-- 1. download the rust-analyzer binary, for example from:
-- https://github.com/rust-lang/rust-analyzer/releases
-- 2. Unpack it AND RENAME the unpacked file, for example:
-- rust-analyzer-x86_64-pc-windows-msvc.gz -> unpack -> rename to rust-analyzer.exe
-- 3. Add the location of .exe to %PATH%

local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})
