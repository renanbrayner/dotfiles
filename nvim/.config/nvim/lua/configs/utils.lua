vim.cmd([[
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
au BufEnter * if &buftype == 'terminal' | startinsert | else | stopinsert | endif


function! ChooseTerm(termname, slider)
	let pane = bufwinnr(a:termname)
	let buf = bufexists(a:termname)
	if pane > 0
		" pane is visible
		if a:slider > 0
			:exe pane . "wincmd c"
		else
			:exe "e #"
		endif
	elseif buf > 0
		" buffer is not in pane
		if a:slider
			:exe "botright 10sp"
		endif
		:exe "buffer " . a:termname
	else
		" buffer is not loaded, create
		if a:slider
			:exe "botright 10sp"
		endif
		:terminal
		:exe "f " a:termname
	endif
endfunction

function! ControlP()
	if &filetype == 'coc-explorer'
		:wincmd h
	endif
	silent! !git rev-parse --is-inside-work-tree
	if v:shell_error == 0
		:GFiles --cached --others --exclude-standard
		" :Telescope git-files
	else
		:Files
		" :Telescope
	endif
endfunction

function! s:init_explorer()
	set winhighlight=Normal:CocExplorer
endfunction

augroup CocExplorerCustom
	autocmd!
	autocmd FileType coc-explorer call <SID>init_explorer()
augroup END
  ]])
