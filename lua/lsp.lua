local ok, configs = pcall(require, 'lspconfig')
if not ok then
    return
end

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
