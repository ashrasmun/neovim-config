vim.cmd([[
    " Disable GUI Tabline
    if exists(':GuiTabline')
        GuiTabline 0
    endif

    " Disable GUI Popupmenu
    if exists(':GuiPopupmenu')
        GuiPopupmenu 0
    endif
]])

--== FONT SIZE ==--

vim.g.gui_font_default_size = 16
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Consolas"
-- vim.g.gui_font_face = "ProFontWindows"

RefreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
    if delta == -1 then
        if vim.g.gui_font_size > 10 then
            vim.g.gui_font_size = vim.g.gui_font_size + delta
        end
    else
        vim.g.gui_font_size = vim.g.gui_font_size + delta
    end

    RefreshGuiFont()
end

ResetGuiFont = function()
    vim.g.gui_font_size = vim.g.gui_font_default_size
    RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps

-- The version in VimScript is more reliable. Consider changing it when Lua
-- works properly.
vim.cmd([[
    nnoremap <silent> <F9>  :lua ResizeGuiFont(1)<CR>
    nnoremap <silent> <F10> :lua ResizeGuiFont(-1)<CR>
    nnoremap <silent> <F12> :lua ResetGuiFont()<CR>

    noremap <silent> <C-ScrollWheelUp> :lua ResizeGuiFont(1)<CR>
    noremap <silent> <C-ScrollWheelDown> :lua ResizeGuiFont(-1)<CR>
    inoremap <silent> <C-ScrollWheelUp> <Esc>:lua ResizeGuiFont(1)<CR>a
    inoremap <silent> <C-ScrollWheelDown> <Esc>:lua ResizeGuiFont(-1)<CR>a
]])
