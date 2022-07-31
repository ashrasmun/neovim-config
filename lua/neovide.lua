--local opts = { noremap = true, silent = true }

--== NEOVIDE ==--

vim.g.neovide_fullscreen = true
vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_cursor_vfx_mode = 'railgun'

-- The version in VimScript is more reliable. Consider changing it when Lua
-- works properly.
vim.cmd([[
function! NeovideToggleFullscreen()
    if g:neovide_fullscreen == v:true
        let g:neovide_fullscreen=v:false
    else
        let g:neovide_fullscreen=v:true
    endif
endfunction

nnoremap <F11> :call NeovideToggleFullscreen()<CR>
]])

--== FONT SIZE ==--

vim.g.gui_font_default_size = 12
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Consolas"

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
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
--vim.keymap.set({'n', 'i'}, "<C-=>", function() ResizeGuiFont(1)  end, opts)
--vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)
--vim.keymap.set({'n', 'i'}, "<C-0>", function() ResetGuiFont()    end, opts)
