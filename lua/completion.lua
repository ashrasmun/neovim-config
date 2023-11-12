-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.cmd([[set completeopt=menuone,noinsert,noselect]])

-- Avoid showing extra messages when using completion
vim.cmd([[set shortmess+=c]])

-- nvim-cmp setup
vim.cmd([[set completeopt=menu,menuone,noselect]])

local lspkind_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_ok then
    return
end

local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
    return
end

lspkind.init()

cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },

    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },

    -- Installed sources
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    },

    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[LSP]',
                nvim_lua = '[api]',
                path = '[path]',
                luasnip = '[snip]', -- TODO: Install luasnip... or vsnip?
            },
        }),
    },

    experimental = {
        native_menu = false,
        ghost_text = true,
    },
})

