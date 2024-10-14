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

