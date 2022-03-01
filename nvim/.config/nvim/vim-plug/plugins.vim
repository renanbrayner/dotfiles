call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'farmergreg/vim-lastplace'                       " reopen vim with cursor on the same position
Plug 'lilydjwg/colorizer'                             " color highlight
Plug 'neoclide/coc.nvim', {'branch': 'release'}       " ultimate autocompletion
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } " show command completion at bottom
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf needs this
Plug 'junegunn/fzf.vim'                               " fuzzy find files
Plug 'antoinemadec/FixCursorHold.nvim'                " fix some shit
Plug 'justinmk/vim-sneak'                             " friendship ended with s, cl is my new best friend
Plug 'unblevable/quick-scope'                         " better FfTt
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'   " snip snap!
Plug 'AndrewRadev/tagalong.vim'                       " auto change both tags
Plug 'mattn/emmet-vim'                                " good old emmet needed for coc-emmet
Plug 'tpope/vim-commentary'                           " autocomment
Plug 'suy/vim-context-commentstring'                  " fix autocomment
Plug 'tpope/vim-surround'                             " surround
Plug 'mhinz/vim-startify'                             " fancy start page
  " ON TRIAL
  " vim-airline was causing some performance issues.
  Plug 'bling/vim-airline'                              " powerfull statusbar (causing freezinh)
  " Plug 'ap/vim-buftabline'                              " buffer tabs (alternative)
Plug 'voldikss/vim-floaterm'                          " terminal inside vim
Plug 'lervag/vimtex'                                  " latex stuff
Plug 'dbeniamine/cheat.sh-vim'                        " wierd search stuff
Plug 'mhinz/vim-signify'                              " git symbols at the left
Plug 'tpope/vim-fugitive'                             " git branch
Plug 'sheerun/vim-polyglot'                           " syntax highlight
Plug 'dracula/vim', { 'as': 'dracula' }               " colortheme
Plug 'Chiel92/vim-autoformat'                         " auto format files on F3
Plug 'tmsvg/pear-tree'                                " nice bracket magic that works
Plug 'editorconfig/editorconfig-vim'                  " editorconfig per project

autocmd User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
