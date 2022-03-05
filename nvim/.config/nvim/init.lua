
-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██║   ██║██║████╗ ████║
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
--           CONFIG FILE
-- BY: https://github.com/renanbrayner

-- Press leader (deffault = <space>) to see keybindings

-- This was made in a vertical screen, maybe some things wont fit
-- porprely on horizontal screens

-- Recomended font: JetBrainsMono Nerd Font Mono

--lua
-- ├── configs
-- │   ├── init.lua   imports everything on configs
-- │   ├── opts.lua   set options
-- │   └── utils.lua  autocmds, functions and misc
-- │
-- ├── plugins
-- │   └── init.lua   packer config and plugins
-- │
-- ├── pluginsconfig  plugins configuration files
-- │   └── init.lua   imports every plugin configuration
-- │
-- └── rice
--     └── init.lua   highlights and colortheme

require'impatient'
vim.cmd("source $HOME/.config/nvim/plugins-config/coc.vim") -- Last surviving vim file
require'pluginsconfig'
require'plugins'
require'configs'
require'rice'
