local ok, configs = pcall(require, 'lspconfig')
if not ok then
    return
end

-- TODO: investigate why doesn't this work
-- local on_attach = function(client)
--     require('completion').on_attach(client)
-- end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         signs = false,
--     }
-- )

--== LUA ==--

configs.sumneko_lua.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

--== POWERSHELL ==--

-- To setup the server, you need to do a bit of additional manual work.
-- 1. download the PowerShellEditorServices:
-- https://github.com/PowerShell/PowerShellEditorServices/releases
-- 2. Point 'bundle_path' to location where the unpacked files live.
-- Unfortunatelly it is not being look for in %PATH% :(

configs.powershell_es.setup({
    bundle_path = vim.env.NVIM_PS_LSP,
    shell = 'powershell.exe',
})

--== PYTHON ==--

-- To setup the server, you need to do a bit of additional manual work.
-- 1. install pyright:
-- pip install pyright

configs.pyright.setup({
    single_file_support = true,
})

--== RUST ==--

-- To setup the server, you need to do a bit of additional manual work.
-- 1. download the rust-analyzer binary, for example from:
-- https://github.com/rust-lang/rust-analyzer/releases
-- 2. Unpack it AND RENAME the unpacked file, for example:
-- rust-analyzer-x86_64-pc-windows-msvc.gz -> unpack -> rename to rust-analyzer.exe
-- 3. Add the location of .exe to %PATH%

configs.rust_analyzer.setup({
    -- on_attach = on_attach,
    settings = {
        ['rust-analyzer'] = {
            imports = {
                granularity = {
                    group = 'module',
                },
                prefix = 'self',
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
        },
    },
})
