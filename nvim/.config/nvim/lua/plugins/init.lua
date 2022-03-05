local fn = vim.fn

-- AUTO INSTALL PACKER
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- AUTO SYNC ON SAVE THIS FILE
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = require('packer.util').float
  }
}

local use = packer.use
packer.reset()

packer.startup(function()
  use {
    'wbthomason/packer.nvim',
    opt = false
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use 'nvim-lua/popup.nvim'
  use {'stevearc/dressing.nvim'}        -- vim.ui select
  use 'rcarriga/nvim-notify'            -- better notifications
  use 'lewis6991/impatient.nvim'        -- better performance for lua plugins
  use 'farmergreg/vim-lastplace'        -- reopen vim with cursor on the same position
  use 'lilydjwg/colorizer'              -- color highlight alt(norcalli/nvim-colorizer.lua)
  use 'antoinemadec/FixCursorHold.nvim' -- fix some shit
  use 'justinmk/vim-sneak'              -- friendship ended with s, cl is my new best friend
  use 'unblevable/quick-scope'           -- better FfTt
  use 'AndrewRadev/tagalong.vim'        -- auto change both tags
  use 'mattn/emmet-vim'                 -- good old emmet needed for coc-emmet
  use 'tpope/vim-commentary'            -- autocomment
  use 'suy/vim-context-commentstring'   -- fix autocomment
  use 'tpope/vim-surround'              -- surround
  use 'voldikss/vim-floaterm'           -- terminal inside vim
  use 'lervag/vimtex'                   -- latex stuff
  use 'dbeniamine/cheat.sh-vim'         -- wierd search stuff
  use 'mhinz/vim-signify'               -- git symbols at the left
  use 'tpope/vim-fugitive'              -- git branch
  use 'sheerun/vim-polyglot'            -- syntax highlight
  use 'Chiel92/vim-autoformat'          -- auto format files on F3
  use 'tmsvg/pear-tree'                 -- nice bracket magic that works
  use 'editorconfig/editorconfig-vim'   -- editorconfig per project
  use 'SirVer/ultisnips'                -- code snippets
  use 'honza/vim-snippets'              -- code snippets
  use 'folke/which-key.nvim'            -- mappings at bottom
  use 'goolord/alpha-nvim'              -- fancy startpage
  use 'lukas-reineke/indent-blankline.nvim' -- indent lines
  use { 'junegunn/fzf.vim' }             -- fzf files
  use { 'neoclide/coc.nvim', branch = 'release' } -- autocomplete
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' } -- fzf files
  use { 'dracula/vim', as = 'dracula' } -- colortheme
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'Shatur/neovim-session-manager',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- AUTO SET UP CONFIG AFTER CLONING
  -- PUT THIS AT THE END
  if PACKER_BOOTSTRAP then
    require"packer".sync()
  end
end)
