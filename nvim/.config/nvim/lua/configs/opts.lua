local set = vim.opt

vim.cmd([[
filetype plugin indent on"
set undodir=~/.config/nvim/undodir
  ]])
set.exrc = true
set.updatetime = 300
set.shortmess = set.shortmess + "c"
set.signcolumn = "yes"
set.writebackup = false
set.backup = false
set.swapfile = false
set.undofile = true
set.hidden = true
set.clipboard = "unnamedplus"
set.mouse = "a"
set.splitright = true
set.splitbelow = true
set.relativenumber = true
set.number = true
set.errorbells = false
set.inccommand = "nosplit"
set.incsearch = true
set.showcmd = true
set.scrolloff = 8
set.diffopt = set.diffopt + "vertical"
set.encoding = "utf-8"
set.syntax = "enable"
set.autoindent = true
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.wildignore = {
  '*/tmp/*',
  '*.so',
  '*.zip',
  '*/vendor/bundle/*',
  '*/node_modules/'
}
set.completeopt = {
  'menuone',
  'noinsert',
  'noselect'
}
