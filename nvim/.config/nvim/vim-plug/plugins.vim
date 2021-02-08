call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

"TRIAL
  Plug 'etdev/vim-hexcolor'                               " color highlight

Plug 'neoclide/coc.nvim', {'branch': 'release'}       " ultimate autocompletion

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } " show command completion at bottom
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf needs this
Plug 'junegunn/fzf.vim'                               " fuzzy find files
Plug 'antoinemadec/FixCursorHold.nvim'                " fix some shit

Plug 'justinmk/vim-sneak'                             " friendship ended with s, cl is my new best friend
Plug 'unblevable/quick-scope'                         " better FfTt

Plug 'Chiel92/vim-autoformat'                         " auto format files
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'   " snip snap!
Plug 'AndrewRadev/tagalong.vim'                       " auto change both tags
Plug 'jiangmiao/auto-pairs'                           " nice bracket magic
Plug 'mattn/emmet-vim'                                " good old emmet
Plug 'tpope/vim-commentary'                           " autocomment
Plug 'tpope/vim-surround'                             " autocomment

" Plug 'preservim/nerdtree'                             " file browser inside vim 
" Plug 'ryanoasis/vim-devicons'                         " icons in nerdtree
" Plug 'Xuyuanp/nerdtree-git-plugin'                    " git stauts icons in nerdtree

Plug 'mhinz/vim-startify'                             " fancy start page
Plug 'dracula/vim', { 'as': 'dracula' }               " colortheme
Plug 'morhetz/gruvbox'                                " another colortheme
Plug 'bling/vim-airline'                              " powerfull statusbar
Plug 'voldikss/vim-floaterm'                          " terminal inside vim

Plug 'lervag/vimtex'                                  " latex stuff

Plug 'styled-components/vim-styled-components'        " styled components syntax highlight
Plug 'sheerun/vim-polyglot'  							            " syntax highlight for ALL!

" ----HACK----
" installed this way instead of with CocInstall to prevent server crashing with typescript
Plug 'coc-extensions/coc-svelte',{'do': 'yarn install --frozen-lockfile'}
" which_key#register function needs this to work
autocmd User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
