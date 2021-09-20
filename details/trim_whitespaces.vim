" This function trims trailing whitespaces in the whole file
function! s:TrimTrailingWhitespaces() range
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

noremap <silent> <Leader>w :call <SID>TrimTrailingWhitespaces()<CR>
