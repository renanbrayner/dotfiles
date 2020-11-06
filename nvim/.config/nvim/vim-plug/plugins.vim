call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'neoclide/coc.nvim', {'branch': 'release'}       " ultimate autocompletion
Plug 'voldikss/vim-floaterm' 						  " floating terminal inside vim!
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } " show command completion at bottom
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf needs this
Plug 'junegunn/fzf.vim'                               " fuzzy find files

"TRIAL
	Plug 'justinmk/vim-sneak'                             " friendship ended with s, cl is my new best friend
Plug 'unblevable/quick-scope'                         " better FfTt

Plug 'Chiel92/vim-autoformat'                         " auto format files
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'   " snip snap!
Plug 'AndrewRadev/tagalong.vim'                       " auto change both tags
Plug 'jiangmiao/auto-pairs'                           " nice bracket magic
Plug 'mattn/emmet-vim'                                " good old emmet
Plug 'tpope/vim-commentary'                           " autocomment

Plug 'preservim/nerdtree'                             " file browser inside vim
Plug 'ryanoasis/vim-devicons'                         " icons in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'                    " git stauts icons in nerdtree

Plug 'mhinz/vim-startify'                             " fancy start page
Plug 'dracula/vim', { 'as': 'dracula' }               " colortheme
Plug 'bling/vim-airline'                              " powerfull statusbar
Plug 'norcalli/nvim-colorizer.lua'                    " nice and colorfull

Plug 'lervag/vimtex'                                  " latex stuff

" TRIAL
	" Plug 'HerringtonDarkholme/yats.vim'                   " ts syntax
	" Plug 'PotatoesMaster/i3-vim-syntax'                   " i3 config syntax highlight
	" Plug 'evanleck/vim-svelte'                            " svelte syntax highlight
	" Plug 'jparise/vim-graphql'                            " graphql syntax highlight
	" Plug 'mxw/vim-jsx'                                    " jsx syntax highlight
	" Plug 'pangloss/vim-javascript'                        " js syntax highlight
	" Plug 'styled-components/vim-styled-components'        " styled components syntax highlight
	" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'        " syntax highlight in nerdtree

	Plug 'sheerun/vim-polyglot'  							" syntax highlight for ALL!

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
