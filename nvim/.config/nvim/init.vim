
" ███╗   ██╗██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██║   ██║██║████╗ ████║
" ██╔██╗ ██║██║   ██║██║██╔████╔██║
" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ CONFIG FILE
" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ BY: https://github.com/renanbrayner
"==============================
"          PLUGINS
"==============================
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'neoclide/coc.nvim', {'branch': 'release'}       " ultimate autocompletion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'   " snip snap!
Plug 'tpope/vim-commentary'                           " autocomment
Plug 'preservim/nerdtree'                             " file browser inside vim
Plug 'Xuyuanp/nerdtree-git-plugin'                    " git stauts icons in nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'        " syntax highlight in nerdtree
Plug 'ryanoasis/vim-devicons'                         " icons in nerdtree
Plug 'mhinz/vim-startify'                             " fancy start page
Plug 'dracula/vim', { 'as': 'dracula' }               " colortheme
Plug 'bling/vim-airline'                              " powerfull statusbar
Plug 'AndrewRadev/tagalong.vim'                       " auto change both tags
Plug 'mattn/emmet-vim'                                " good old emmet
Plug 'jiangmiao/auto-pairs'                           " nice bracket magic
Plug 'lervag/vimtex'                                  " latex stuff
Plug 'Chiel92/vim-autoformat'                         " auto format files
Plug 'jparise/vim-graphql'                            " graphql syntax highlight
Plug 'PotatoesMaster/i3-vim-syntax'                   " i3 config syntax highlight
Plug 'HerringtonDarkholme/yats.vim'                   " ts Syntax
Plug 'pangloss/vim-javascript'                        " js syntax highlight
Plug 'mxw/vim-jsx'                                    " jsx syntax highlight
Plug 'evanleck/vim-svelte'                            " svelte syntax highlight
Plug 'styled-components/vim-styled-components'        " styled components syntax highlight
Plug 'ap/vim-css-color'                               " colors syntax highlight ?
Plug 'junegunn/fzf.vim'                               " fuzzy find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf needs this
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } " show command completion at bottom

" ----HACK----
" installed this way instead of with CocInstall to prevent server crashing with typescript
Plug 'coc-extensions/coc-svelte',{'do': 'yarn install --frozen-lockfile'}
" which_key#register function needs this to work
autocmd User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

call plug#end()
"==============================
"      LEADER MAPPINGS
"==============================

let mapleader ="\<Space>"

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_disable_default_offset = 1
let g:which_key_use_floating_win = 1

autocmd FileType which_key setlocal nospell

let g:which_key_map =  {}

nnoremap <leader>w<Left> <C-W>h
nnoremap <leader>w<Down> <C-W>j
nnoremap <leader>w<Up> <C-W>k
nnoremap <leader>w<Right> <C-W>l

let g:which_key_map.w = {
	\ 'name' : '+window'  ,
	\ 'w' : ['<C-W>W'     , 'other-window']          ,
	\ 'd' : ['<C-W>c'     , 'delete-window']         ,
	\ 's' : ['<C-W>s'     , 'split-window-below']    ,
	\ 'v' : ['<C-W>v'     , 'split-window-aside']    ,
	\ 'h' : ['<C-W>h'     , 'window-left']           ,
	\ 'j' : ['<C-W>j'     , 'window-below']          ,
	\ 'l' : ['<C-W>l'     , 'window-right']          ,
	\ 'k' : ['<C-W>k'     , 'window-up']             ,
	\ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
	\ 'J' : [':resize +5' , 'expand-window-below']   ,
	\ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
	\ 'K' : [':resize -5' , 'expand-window-up']      ,
	\ '=' : ['<C-W>='     , 'balance-window']        ,
	\ 'm' : ['<C-W>_'     , 'maximaze-window']       ,
	\ 'q' : ['ZQ'         , 'close-window']          ,
	\ 'c' : ['ZZ'         , 'save-and-close-window'] ,
	\}

let g:which_key_map.o = {
	\ 'name' : '+toggle'                                 ,
	\ 't'    : [':call ChooseTerm("term-slider", 1)<CR>' , 'toggle-terminal-split'] ,
	\ 'p'    : [':NERDTreeToggle'                        , 'toggle-nerdtree']       ,
	\ 's'    : [':setlocal spell! spelllang=en_us,pt'    , 'toggle-spellcheck']     ,
	\}

nmap <leader>bc :b 

let g:which_key_map.b = {
	\ 'name' : '+buffers'               ,
	\ 'b'    : [':Buffers'              , 'buffer-fuzzy-find']      ,
	\ 'n'    : [':call NextBufferTab()' , 'buffer-next']            ,
	\ 'p'    : [':call PrevBufferTab()' , 'buffer-previous']        ,
	\ 'd'    : [':bp | bd #'            , 'buffer-delete']          ,
	\ 't'    : [':bdelete! term-slider' , 'buffer-terminal-delete'] ,
	\ 'l'    : [':buffers'              , 'buffer-list-all']        ,
	\ 's'    : [':w'                    , 'buffer-save']            ,
	\ 'c'    : 'buffer-command'         ,
	\}

let g:which_key_map.v = {
	\ 'name' : '+vim'  ,
	\ 'q'    : [':qa!' , 'vim-exit']                              ,
	\ 'c'    : [':wqa' , 'vim-save-and-exit']                     ,
	\ 's'    : [':wa'  , 'vim-save']                              ,
	\ 'r'    : [':source ~/.config/nvim/init.vim' , 'vim-reload'] ,
	\}

let g:which_key_map.c = {
	\ 'name' :'+coc'                   ,
	\ 'c': [':CocCommand'              , 'Coc-command']              ,
	\ 'd': [':CocList diagnostics'     , 'Coc-show-all-diagnostics'] ,
	\ 'e': [':CocList extensions'      , 'Coc-manage-extensions']    ,
	\ 'l': [':CocList commands'        , 'Coc-list-commands']        ,
	\ 'o': [':CocList outline'         , 'Coc-outline']              ,
	\ 's': [':CocList -I symbols'      , 'Coc-search-symbols']       ,
	\ 'j': [':CocNext'                 , 'Coc-action-previous']      ,
	\ 'k': [':CocPrev'                 , 'Coc-action-next']          ,
	\ 'r': ['<Plug>(coc-range-select)' , 'Coc-range-select']         ,
	\}

nmap <leader>. :Explore<CR>

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
nnoremap <C-p> :Files<Cr>

"==============================
"           CONFIGS
"==============================

" TODO:Thinking about changing this clipboard  <21-10-20> "
set clipboard=unnamedplus
set go=a
set mouse=a
set splitbelow splitright
set relativenumber number
set inccommand=nosplit
set incsearch
set showcmd
set cpoptions+=I          " This prevents the autoindent to be errased after movement

" TABS
set autoindent
set cindent
set copyindent
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4

set encoding=utf-8
set nocompatible
syntax on

" VIMTEX
let g:tex_flavor = 'latex'

" JUST STOP
map q: <nop>
nnoremap Q <nop>

" No autocomment new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Make control p faster
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

" Prettier format on save
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" airline tabs
let g:airline#extensions#tabline#enabled = 1

" Control/ to comment"
vmap  gc
nmap  gcc

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Powerline effect
let g:airline_powerline_fonts = 1

" Autoformat on F3 keypress
noremap <silent> <F3> :Autoformat<CR>

"==============================
"           RICE
"==============================

colorscheme dracula
:set cursorline
highlight Normal guibg=NONE ctermbg=NONE
highlight CursorLine guibg=238 ctermbg=238
highlight clear SpellBad
highlight SpellBad cterm=undercurl ctermfg=1
highlight SpellCap cterm=undercurl ctermfg=3

"==============================
"         NERDTREE
"==============================

let NERDTreeMinimalUI=1
let NERDTreeWinPos="right"
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']
autocmd VimEnter * execute("normal \<C-w>W")

"==============================
"         STARTIFY
"==============================

autocmd VimEnter *
	\   if !argc()
	\ |   Startify
	\ |   NERDTree
	\ |   wincmd w
	\ | endif
autocmd User StartifyBufferOpened :NERDTreeClose

function! s:gitModified()
	let files = systemlist('git ls-files -m 2>/dev/null')
	return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
	let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
	return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:nerdtreeBookmarks()
	let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
	let bookmarks = bookmarks[0:-2]
	return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_padding_left = 3

let g:startify_lists = [
	\ { 'type': 'files',     'header': ['   Most recently used files']},
	\ { 'type': 'dir',       'header': ['   Most recently used files in '. getcwd()] },
	\ { 'type': 'sessions',  'header': ['   Sessions']       },
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	\ { 'type': function('s:gitModified'),  'header': ['   git modified']},
	\ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
	\ { 'type': 'commands',  'header': ['   Commands']       },
	\ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree bookmarks']}
	\ ]

let g:startify_custom_header = [
	\'    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
	\'    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
	\'    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
	\'    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
	\'    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
	\'    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
	\ ]

"==============================
"             COC
"==============================

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-json',
	\ 'coc-css',
	\ ]

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
	else
	call CocAction('doHover')
	endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <F2> <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

xmap <silent> <leader>cr <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"==============================
"          TERMINAL
"==============================

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
tnoremap <C-v><Esc> <Esc>

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

