" ███╗   ██╗██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██║   ██║██║████╗ ████║
" ██╔██╗ ██║██║   ██║██║██╔████╔██║
" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ CONFIG FILE
" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ BY: https://github.com/renanbrayner

"==============================
"          PLUGINS
"==============================
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plugins-config/airline.vim
source $HOME/.config/nvim/plugins-config/autoformat.vim
source $HOME/.config/nvim/plugins-config/coc.vim
source $HOME/.config/nvim/plugins-config/commentary.vim
source $HOME/.config/nvim/plugins-config/startify.vim
source $HOME/.config/nvim/plugins-config/ultisnips.vim
source $HOME/.config/nvim/plugins-config/vimtex.vim
source $HOME/.config/nvim/plugins-config/vim-floaterm.vim
source $HOME/.config/nvim/plugins-config/quickscope.vim
source $HOME/.config/nvim/plugins-config/fixcursorhold.vim

"==============================
"      LEADER MAPPINGS
"==============================

let mapleader ="\<Space>"

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_disable_default_offset = 1
let g:which_key_use_floating_win = 1

autocmd FileType which_key setlocal nospell

let g:which_key_map = {
	\ '>' : [':call NextBufferTab()'              , 'tab-next']     ,
	\ '<' : [':call PrevBufferTab()'              , 'tab-previous'] ,
	\ "'" : [':call ChooseTerm("term-slider", 1)' , 'terminal']     ,
	\ "." : [':Explore'                           , 'netrw']        ,
	\ "C" : 'toggle-cheatsheet-comments'          ,
	\}

let g:which_key_map.w = {
	\ 'name'   : '+window'     ,
	\ 'w'      : ['<C-W>W'     , 'other-window']          ,
	\ 'd'      : ['<C-W>c'     , 'delete-window']         ,
	\ 's'      : ['<C-W>s'     , 'split-window-below']    ,
	\ 'v'      : ['<C-W>v'     , 'split-window-aside']    ,
	\ 'h'      : ['<C-W>h'     , 'window-left']           ,
	\ 'j'      : ['<C-W>j'     , 'window-below']          ,
	\ 'l'      : ['<C-W>l'     , 'window-right']          ,
	\ 'k'      : ['<C-W>k'     , 'window-up']             ,
	\ 'H'      : ['<C-W>5<'    , 'expand-window-left']    ,
	\ 'J'      : [':resize +5' , 'expand-window-below']   ,
	\ 'L'      : ['<C-W>5>'    , 'expand-window-right']   ,
	\ 'K'      : [':resize -5' , 'expand-window-up']      ,
	\ '='      : ['<C-W>='     , 'balance-window']        ,
	\ '-'      : ['<C-W>_'     , 'maximaze-window']       ,
	\ 'q'      : ['ZQ'         , 'close-window']          ,
	\ 'c'      : ['ZZ'         , 'save-and-close-window'] ,
	\ '<Left>' : ['<C-W>h'     , 'move-left']             ,
	\ '<Right>': ['<C-W>l'     , 'move-right']            ,
	\ '<Up>'   : ['<C-W>k'     , 'move-up']               ,
	\ '<Down>' : ['<C-W>j'     , 'move-down']             ,
	\}

let g:which_key_map.o = {
	\ 'name' : '+toggle'                              ,
	\ 't'    : [':call ChooseTerm("term-slider", 1)'  , 'terminal-split']        ,
	\ 's'    : [':setlocal spell! spelllang=en_us,pt' , 'spellcheck']            ,
	\ 'p'    : [':CocCommand explorer'                , 'file-tree']             ,
	\}

nmap <leader>bc :b 

let g:which_key_map.b = {
	\ 'name' : '+buffers'                           ,
	\ 'o'    : [':%bd|e#|bd#'                       , 'buffer-only']            ,
	\ 'b'    : [':Buffers'                          , 'buffer-fuzzy-find']      ,
	\ 'n'    : [':call NextBufferTab()'             , 'buffer-next']            ,
	\ 'p'    : [':call PrevBufferTab()'             , 'buffer-previous']        ,
	\ 'd'    : [':bp | bd #'                        , 'buffer-delete']          ,
	\ 't'    : [':bdelete! term-slider'             , 'buffer-terminal-delete'] ,
	\ 'l'    : [':buffers'                          , 'buffer-list-all']        ,
	\ 's'    : [':w'                                , 'buffer-save']            ,
	\ 'c'    : 'buffer-command'                     ,
	\}

let g:which_key_map.v = {
	\ 'name' : '+vim'  ,
	\ 'q'    : [':qa!' , 'vim-exit']                                     ,
	\ 'c'    : [':wqa' , 'vim-save-and-exit']                            ,
	\ 's'    : [':wa'  , 'vim-save']                                     ,
	\ 'r'    : [':source ~/.config/nvim/init.vim' , 'vim-reload-source'] ,
	\}

let g:which_key_map.K = {
	\ 'name' :'+cheatsheet'         ,
	\ 'K'    : 'not-working!'       ,
	\ 'B'    : 'awnser-on-buffer'   ,
	\ 'R'    : 'awnser-replace'     ,
	\ 'P'    : 'awnser-below'       ,
	\ 'C'    : 'toggle-last-comment',
	\ 'E'    : 'send-error'         ,
	\ 'L'    : 'last-query'         ,
	\}

let g:which_key_map.c = {
	\ 'name' :'+coc'                       ,
	\ 'c'    : [':CocCommand'              , 'Coc-command']              ,
	\ 'd'    : [':CocList diagnostics'     , 'Coc-show-all-diagnostics'] ,
	\ 'e'    : [':CocList extensions'      , 'Coc-manage-extensions']    ,
	\ 'l'    : [':CocList commands'        , 'Coc-list-commands']        ,
	\ 'o'    : [':CocList outline'         , 'Coc-outline']              ,
	\ 's'    : [':CocList -I symbols'      , 'Coc-search-symbols']       ,
	\ 'j'    : [':CocNext'                 , 'Coc-action-previous']      ,
	\ 'k'    : [':CocPrev'                 , 'Coc-action-next']          ,
	\ 'r'    : ['<Plug>(coc-range-select)' , 'Coc-range-select']         ,
	\}

let g:which_key_map.t = {
	\ 'name' : '+terminal'                                       ,
	\ 'T'    : [':call ChooseTerm("term-slider", 1)'             , 'terminal'] ,
	\ 'f'    : [':FloatermNew fzf'                               , 'fzf']      ,
	\ 'g'    : [':FloatermNew lazygit'                           , 'git']      ,
	\ 'd'    : [':FloatermNew lazydocker'                        , 'docker']   ,
	\ 'n'    : [':FloatermNew node'                              , 'node']     ,
	\ 'p'    : [':FloatermNew python'                            , 'python']   ,
	\ 'm'    : [':FloatermNew lazynpm'                           , 'npm']      ,
	\ 'r'    : [':FloatermNew --width=0.99 --height=0.99 ranger' , 'ranger']   ,
	\ 't'    : [':FloatermToggle'                                , 'toggle']   ,
	\ 's'    : [':FloatermNew gotop'                             , 'gotop']    ,
	\ 'h'    : [':FloatermNew ncdu'                              , 'ncdu']     ,
	\ }

"==============================
"       OTHER MAPPINGS
"==============================

" Move lines up and down with ALT + Movement
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-Down> :m .+1<CR>==

inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-Down> <Esc>:m .+1<CR>==gi

vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

" CtrlP to FZF (faster)
function! ControlP()
  silent! !git rev-parse --is-inside-work-tree
  if v:shell_error == 0
     :GFiles --cached --others --exclude-standard
  else
     :Files
endif
endfunction

noremap <C-p> :call ControlP()<CR>

" ESC to remove search highlight
nnoremap <silent> <Esc> :noh<Esc>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Tab to... change tab
nnoremap <TAB> :call NextBufferTab()<CR>
nnoremap <S-TAB> :call PrevBufferTab()<CR>

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>

"=============================
"           CONFIGS
"==============================

" set exrc " calls local vim config when runing 'vim .'
set updatetime=300        " needed for coc
set shortmess+=c          " needed for coc
set signcolumn=yes        " needed for coc (extra space on the left)


set clipboard=unnamedplus " paste from outside and to outside
set go=a
set hidden                " needed for coc
set noerrorbells          " stop noisy bells from ringing
set mouse=a               " mouse functionality DONT JUDGE ME
set splitbelow splitright " a non retarded way to open new splits
set relativenumber number " actual line number in the current line and relativenumbers in other lines
set inccommand=nosplit
set incsearch             " highlight when searching
set showcmd
set cpoptions+=I          " This prevents the autoindent to be errased after movement
set scrolloff=8

set nowritebackup         " needed for coc
set nobackup              " needed for coc
" set noswapfile
" set undodir=~/.config/nvim/undodir
" set undofile

" TABS
set expandtab     " Use spaces instead of tabs
set shiftwidth=2  " Set indentation for >> << == and autoindenting 
set softtabstop=2 " weird stuff with backspace and tab
set tabstop=2     " change width of tab character

set autoindent  " Copy the indenting of current line in the next line
set smartindent " Clever autoindenting
set copyindent  " Copy the structure of the existing lines indent when autoindenting a new line.


set encoding=utf-8
set nocompatible
syntax on

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

" tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
" tnoremap <expr> <Esc> (&filetype == "floaterm") ? "<Esc>" : "<c-\><c-n>"
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
"            LUA
"==============================
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
" lua require'nvim-treesitter.configs'.setup { indent = { enable = true } } " This is buggy as of early 2021

"==============================
"           RICE
"==============================

:set cursorline
:set noshowmode
" highlight Normal guibg=NONE ctermbg=NONE
" highlight CursorLine guibg=238 ctermbg=238
highlight clear SpellBad
highlight SpellBad cterm=undercurl ctermfg=1
highlight SpellCap cterm=undercurl ctermfg=3
highlight QuickScopePrimary ctermfg=2 cterm=underline
highlight QuickScopeSecondary ctermfg=4 cterm=underline
let g:gruvbox_contrast_dark = 'hard'

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme gruvbox
set background=dark
