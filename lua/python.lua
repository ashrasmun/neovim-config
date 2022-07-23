-- To setup the server, you need to do a bit of additional manual work.
-- 1. install pyright:
-- pip install pyright
--

require'lspconfig'.pyright.setup{
    single_file_support = true
}
