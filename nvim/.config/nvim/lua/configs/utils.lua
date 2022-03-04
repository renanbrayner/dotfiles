vim.cmd([[
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
au BufEnter * if &buftype == 'terminal' | startinsert | else | stopinsert | endif
set undodir="~/.config/nvim/undodir"

" function! CallAlpha()
"   Alpha
" endfunction
"
" autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | call CallAlpha() | endif
"
" autocmd BufLeave * set relativenumber = 0
"
" function! CheckAlpha()
"   if line2byte('.') == -1 && len(tabpagebuflist()) == 1 && &filetype != 'alpha'
"     call CallAlpha() 
"   endif
" endfunction

  ]])
