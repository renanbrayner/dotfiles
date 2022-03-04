--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗
--  ████╗  ██║██║   ██║██║████╗ ████║
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
--            CONFIG FILE
--  BY: https://github.com/renanbrayner

-- ==============================
--           PLUGINS
-- ==============================

require('impatient')
-- " NOT LUA PLUGINS START
require('config/polyglot')
vim.cmd("source $HOME/.config/nvim/plugins-config/coc.vim")
require('config/fixcursorhold')
require('config/quickscope')
require('config/signify')
require('config/ultisnips')
require('config/floaterm')
require('config/vimtex')
require('config/peartree')
require('config/fzf')
-- " NOT LUA PLUGINS END
require('config/indentblankline')
require('config/barbar')
require('config/alpha')
require('config/whichkey')
require('config/lualine')
require('config/devicons')
require('plugins')

require('porting/opts')

vim.cmd([[
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
	silent! !git rev-parse --is-inside-work-tree
	if v:shell_error == 0
		:GFiles --cached --others --exclude-standard
		" :Telescope git-files
	else
		:Files
		" :Telescope
endif
endfunction
]])

require('porting/rice')
