vim.cmd([[
function! QtToggleFullscreen() abort
    if g:GuiWindowFullScreen == v:true
        call GuiWindowFullScreen(0)
    else
        call GuiWindowFullScreen(1)
    endif
endfunction

nnoremap <F11> :call QtToggleFullscreen()<CR>
]])

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

vim.g.gui_font_default_size = 12
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Consolas"

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
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
]])
