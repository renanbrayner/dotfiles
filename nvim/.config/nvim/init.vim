" ███╗   ██╗██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██║   ██║██║████╗ ████║
" ██╔██╗ ██║██║   ██║██║██╔████╔██║
" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ CONFIG FILE
" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ BY: https://github.com/renanbrayner

"==============================
"          PLUGINS
"==============================
lua require('impatient')
source $HOME/.config/nvim/plugins-config/polyglot.vim
source $HOME/.config/nvim/plugins-config/autoformat.vim
source $HOME/.config/nvim/plugins-config/coc.vim
source $HOME/.config/nvim/plugins-config/fixcursorhold.vim
source $HOME/.config/nvim/plugins-config/quickscope.vim
source $HOME/.config/nvim/plugins-config/signify.vim
source $HOME/.config/nvim/plugins-config/ultisnips.vim
source $HOME/.config/nvim/plugins-config/vim-floaterm.vim
source $HOME/.config/nvim/plugins-config/vimtex.vim
source $HOME/.config/nvim/plugins-config/pear-tree.vim
source $HOME/.config/nvim/plugins-config/fzf.vim
lua require('config/devicons')
lua require('config/indentblankline')
lua require('config/barbar')
lua require('config/alpha')
lua require('config/whichkey')
lua require('config/lualine')
lua require('plugins')
" source $HOME/.config/nvim/plugins-config/devicons.vim

"==============================
"      LEADER MAPPING
"==============================

let mapleader ="\<Space>"

"==============================
"       OTHER MAPPINGS
"==============================

" --- ATENTION ---
" most mappings are in the ~/.config/nvim/lua/config/whichkey.lua file

vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

" ESC to remove search highlight
nnoremap <silent> <Esc> :noh<Esc>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" vim-commentary
" gv at the end to return to visual mode
" will add latter to which-key
vmap  gcgv
nmap  gcc

"==============================
"           CONFIGS
"==============================

set exrc                  " calls local vim config when runing 'vim .'
set updatetime=300        " needed for coc
set shortmess+=c          " needed for coc
set signcolumn=yes        " needed for coc (extra space on the left)

set nowritebackup         " needed for coc
set nobackup              " needed for coc
set noswapfile            " why have it?
set undofile              " file for saving history of undo
set undodir=~/.config/nvim/undodir " save undo file in this dir

set hidden                " needed for coc

set clipboard=unnamedplus " paste from outside and to outside
set mouse=a               " mouse functionality DONT JUDGE ME
set splitbelow splitright " a non retarded way to open new splits
set relativenumber number " actual line number in the current line and relativenumbers in other lines
set noerrorbells          " stop noisy bells from ringing
set inccommand=nosplit    " search on current buffer not on split
set incsearch             " highlight when searching
set showcmd                " Show command on last line of vim
" removed because of problems with indentation when autocompleting inside ()
" set cpoptions+=I          " This prevents the autoindent to be errased after movement
set scrolloff=8           " Space between end of file and cursor
set diffopt+=vertical     " starts diff in vertical mode
set completeopt=menuone,noinsert,noselect

set encoding=utf-8        " utf-8 ofc

syntax enable

" Show invisible characters
" set list listchars=tab:>\ ,trail:-,eol:$

" Indenting
set autoindent
filetype plugin indent on

set tabstop=2             " number of spaces to use on tab character
set shiftwidth=2          " indenting is 2 spaces
" set expandtab             " use spaces instead of tab character

" JUST STOP
map q: <nop>
nnoremap Q <nop>

" No autocomment new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

"==============================
"          TERMINAL
"==============================

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
tnoremap <expr> <Esc> (&filetype == "floaterm") ? "<Esc>" : "<c-\><c-n>"
tnoremap <C-v><Esc> <c-\><c-n>

let g:airline#extensions#tabline#ignore_bufadd_pat = 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!|term'

au BufEnter * if &buftype == 'terminal' | startinsert | else | stopinsert | endif
function! PrevBufferTab()
	bprev
	if &buftype == 'terminal'
		bprev
	endif
endfunction

function! NextBufferTab()
	bnext
	if &buftype == 'terminal'
		bnext
	endif
endfunction


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

"==============================
"         FUNCTIONS
"==============================

" CtrlP to FZF (faster)
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

"==============================
"           RICE
"==============================
colorscheme dracula

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

:set cursorline
:set noshowmode
:set termguicolors

highlight! link QuickScopePrimary MatchParen
highlight! link QuickScopeSecondary DraculaLink

:highlight NonText guifg=#44475a
:highlight CursorLine guibg=#282a37
:highlight Normal guibg=#1c1c28
:highlight EndOfBuffer guifg=#1c1c28 " remove end of buffer ~

" Meaning of terms:
"
" format: "Buffer" + status + part
"
" status:
"     *Current: current buffer
"     *Visible: visible but not current buffer
"    *Inactive: invisible but not current buffer
"
" part:
"        *Icon: filetype icon
"       *Index: buffer index
"         *Mod: when modified
"        *Sign: the separator between buffers
"      *Target: letter in buffer-picking mode
"
" BufferTabpages: tabpage indicator
" BufferTabpageFill: filler after the buffer section
" BufferOffset: offset section, created with set_offset()

:highlight BufferInactiveMod guifg=#f1fa8c
:highlight BufferVisibleMod guifg=#6272a4
:highlight BufferCurrentMod guifg=#ffb86c

:highlight IndentBlanklineIndent1 guifg=#7e444f gui=nocombine
:highlight IndentBlanklineIndent2 guifg=#816e52 gui=nocombine
:highlight IndentBlanklineIndent3 guifg=#5a7051 gui=nocombine
:highlight IndentBlanklineIndent4 guifg=#396975 gui=nocombine
:highlight IndentBlanklineIndent5 guifg=#3f668c gui=nocombine
:highlight IndentBlanklineIndent6 guifg=#714a83 gui=nocombine
