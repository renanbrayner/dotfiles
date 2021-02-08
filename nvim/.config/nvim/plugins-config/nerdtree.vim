let NERDTreeMinimalUI=1
let NERDTreeWinPos="right"
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']
autocmd VimEnter * execute("normal \<C-w>W")

autocmd VimEnter *
	\   if !argc()
	\ |   Startify
	\ |   NERDTree
	\ |   wincmd w
	\ | endif
autocmd User StartifyBufferOpened :NERDTreeClose

