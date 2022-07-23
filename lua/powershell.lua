-- To setup the server, you need to do a bit of additional manual work.
-- 1. download the PowerShellEditorServices:
-- https://github.com/PowerShell/PowerShellEditorServices/releases
-- 2. Point 'bundle_path' to location where the unpacked files live.
-- Unfortunatelly it is not being look for in %PATH% :(

local ps_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

ps_lsp.powershell_es.setup{
    -- bundle_path = vim.env.PATH,
    bundle_path = 'h:\\tools\\ps_lsp',
    shell = 'powershell.exe'
}


