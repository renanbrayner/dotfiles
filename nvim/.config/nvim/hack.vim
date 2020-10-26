
" ███╗   ██╗██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██║   ██║██║████╗ ████║
" ██╔██╗ ██║██║   ██║██║██╔████╔██║
" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ CONFIG FILE
" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ BY: github.com/renanbrayner

"==============================
"          PLUGINS
"==============================

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'lambdalisue/suda.vim'                           " sudo powers
Plug 'neoclide/coc.nvim', {'branch': 'release'}       " ultimate autocompletion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'   " my little baby - snip snap!
Plug 'scrooloose/nerdcommenter'                       " Control + / comment
Plug 'preservim/nerdtree'                             " file browser inside vim
Plug 'Xuyuanp/nerdtree-git-plugin'                    " git stauts icons in nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'        " syntax highlight in nerdtree
Plug 'ryanoasis/vim-devicons'                         " icons in nerdtree
Plug 'ctrlpvim/ctrlp.vim'                             " fuzzy find files
Plug 'Yggdroot/indentLine'                            " lines on indentations
Plug 'mhinz/vim-startify'                             " fancy start page
Plug 'dracula/vim', { 'as': 'dracula' }               " colortheme
Plug 'bling/vim-airline'                              " powerfull statusbar
Plug 'AndrewRadev/tagalong.vim'                       " auto change both tags  
Plug 'mattn/emmet-vim'                                " good old emmet
Plug 'prettier/vim-prettier', { 'do': 'npm install' } " not just prettier
Plug 'PotatoesMaster/i3-vim-syntax'                   " i3 config syntax highlight
Plug 'HerringtonDarkholme/yats.vim'                   " ts Syntax
Plug 'pangloss/vim-javascript'                        " js syntax highlight
Plug 'mxw/vim-jsx'                                    " jsx syntax highlight
Plug 'evanleck/vim-svelte'                            " svelte syntax highlight
Plug 'styled-components/vim-styled-components'        " styled components syntax highlight
Plug 'ap/vim-css-color'                               " colors syntax highlight ?
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

let g:which_key_map =  {}

nnoremap <leader>w<Left> <C-W>h
nnoremap <leader>w<Down> <C-W>j
nnoremap <leader>w<Up> <C-W>k
nnoremap <leader>w<Right> <C-W>l

let g:which_key_map.w = {
  \ 'name' : '+windows' ,
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
      \ 'name' : '+open' ,
      \ 't' : [':call ChooseTerm("term-slider", 1)<CR>', 'open-terminal-split'] ,
      \ 'p' : [':NERDTreeToggle' , 'open-nerdtree']       ,
      \}

nmap <leader>bc :b 

let g:which_key_map.b = {
      \ 'name' : '+buffers'  ,
      \ 'b' : [':CtrlPBuffer'     , 'buffer-fuzzy-find']     ,
      \ 'n' : [':call NextBufferTab()'     , 'buffer-next']     ,
      \ 'p' : [':call PrevBufferTab()'     , 'buffer-previous'] ,
      \ 'd' : [':bp | bd #', 'buffer-delete']   ,
      \ 't' : [':bdelete! term-slider', 'buffer-terminal-delete']   ,
      \ 'l' : [':buffers', 'buffer-list-all'] ,
      \ 's' : [':w'      , 'buffer-save']     ,
      \ 'c' : 'buffer-command'                    ,
      \}

let g:which_key_map.v = {
      \ 'name' : 'vim',
      \ 'q': [':qa!', 'vim-exit'],
      \ 'c': [':wqa', 'vim-save-and-exit'],
      \ 's': [':wa', 'vim-save'],
      \}

let g:which_key_map.c = {
      \ 'name' :'Coc',
      \ 'd': [':<C-u>CocList diagnostics<cr>', 'Coc-show-all-diagnostics'],
      \ 'e': [':<C-u>CocList extensions<cr>', 'Coc-manage-extensions'],
      \ 'l': [':<C-u>CocList commands<cr>', 'Coc-list-commands'],
      \ 'o': [':<C-u>CocList outline<cr>', 'Coc-outline'],
      \ 's': [':<C-u>CocList -I symbols<cr>', 'Coc-search-symbols'],
      \ 'j': [':<C-u>CocNext<CR>', 'Coc-action-previous'],
      \ 'k': [':<C-u>CocPrev<CR>', 'Coc-action-next'],
      \ 'r': ['<Plug>(coc-range-select)', 'Coc-range-select'],
      \}

nmap <leader>. :Explore<CR>

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

"==============================
"           CONFIGS
"==============================

" TODO:Thinking about changing this clipboard  <21-10-20> "
set clipboard=unnamedplus
set encoding=utf-8
set mouse=a
set splitbelow splitright
set relativenumber number
set cindent
set tabstop=2
set smarttab
set shiftwidth=2
set expandtab 
set inccommand=nosplit

" COC
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes

" No autocomment new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Make control p faster
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Prettier format on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Rice
colorscheme dracula
:set cursorline 
highlight Normal guibg=NONE ctermbg=NONE
highlight CursorLine guibg=238 ctermbg=238

" airline tabs
let g:airline#extensions#tabline#enabled = 1

" Control/ to comment"
vmap  <plug>NERDCommenterToggle 
nmap  <plug>NERDCommenterToggle

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Powerline effect
let g:airline_powerline_fonts = 1


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

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
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
      \ '   ██████╗     ███████╗    ███╗   ██╗     █████╗    ███╗   ██╗',
      \ '   ██╔══██╗    ██╔════╝    ████╗  ██║    ██╔══██╗   ████╗  ██║',
      \ '   ██████╔╝    █████╗      ██╔██╗ ██║    ███████║   ██╔██╗ ██║',
      \ '   ██╔══██╗    ██╔══╝      ██║╚██╗██║    ██╔══██║   ██║╚██╗██║',
      \ '   ██║  ██║    ███████╗    ██║ ╚████║    ██║  ██║   ██║ ╚████║',
      \ '   ╚═╝  ╚═╝    ╚══════╝    ╚═╝  ╚═══╝    ╚═╝  ╚═╝   ╚═╝  ╚═══╝',
      \ '   ██████╗ ██████╗  █████╗ ██╗   ██╗███╗   ██╗███████╗██████╗ ',
      \ '   ██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝████╗  ██║██╔════╝██╔══██╗',
      \ '   ██████╔╝██████╔╝███████║ ╚████╔╝ ██╔██╗ ██║█████╗  ██████╔╝',
      \ '   ██╔══██╗██╔══██╗██╔══██║  ╚██╔╝  ██║╚██╗██║██╔══╝  ██╔══██╗',
      \ '   ██████╔╝██║  ██║██║  ██║   ██║   ██║ ╚████║███████╗██║  ██║',
      \ '   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝',
      \ '   - PORTFOLIO:  renanbrayner.vercel.app',
      \ '   - GITHUB:     github.com/renanbrayner',
      \ '   - INSTAGRAM:  @renan.brayner',
      \ '   - LINKEDIN:   linkedin.com/in/renanbrayner',
      \ ] 

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-css',
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
xmap <silent> <leader>cr <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"==============================
"          TERMINAL
"==============================

tnoremap <Esc> <C-\><C-n>
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
