local wk = require("which-key")
local map = vim.api.nvim_set_keymap
local nrmp = { noremap = true }

-- SET LEADER KEY
vim.g.mapleader = ' '

wk.setup({
    window = {
      border = "none",
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 4, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
  })

wk.register({
    ["<C-p>"]    = { "<cmd>call ControlP()<cr>"         , "Search files"},
    ["<C-s>"]    = { "<cmd>:w<cr>"                      , "Save file" },
    ["<A-Up>"]   = { "<cmd>m .-2<CR>=="                 , "Move line up"},
    ["<A-k>"]    = { "<cmd>m .-2<CR>=="                 , "Move line up"},
    ["<A-Down>"] = { "<cmd>m .+1<CR>=="                 , "Move line down"},
    ["<A-j>"]    = { "<cmd>m .+1<CR>=="                 , "Move line down"},
    ["<A-,>"]    = { "<cmd>BufferPrevious<CR>"          , "Previous tab"},
    ["<A-.>"]    = { "<cmd>BufferNext<CR>"              , "Next tab"},
    ["<A-<>"]    = { "<cmd>BufferMovePrevious<CR>"      , "Move tab previous"},
    ["<A->>"]    = { "<cmd>BufferMoveNext<CR>"          , "Move tab next"},
    ["<A-1>"]    = { "<cmd>BufferGoto 1<CR>"            , "Go to tab 1"},
    ["<A-2>"]    = { "<cmd>BufferGoto 2<CR>"            , "Go to tab 2"},
    ["<A-3>"]    = { "<cmd>BufferGoto 3<CR>"            , "Go to tab 3"},
    ["<A-4>"]    = { "<cmd>BufferGoto 4<CR>"            , "Go to tab 4"},
    ["<A-5>"]    = { "<cmd>BufferGoto 5<CR>"            , "Go to tab 5"},
    ["<A-6>"]    = { "<cmd>BufferGoto 6<CR>"            , "Go to tab 6"},
    ["<A-7>"]    = { "<cmd>BufferGoto 7<CR>"            , "Go to tab 7"},
    ["<A-8>"]    = { "<cmd>BufferGoto 8<CR>"            , "Go to tab 8"},
    ["<A-9>"]    = { "<cmd>BufferGoto 9<CR>"            , "Go to tab 9"},
    ["<A-0>"]    = { "<cmd>BufferLast<CR>"              , "Go to last tab"},
    ["<A-c>"]    = { "<cmd>BufferClose<CR>"             , "Close tab"},
    ["<A-o>"]    = { "<cmd>BufferCloseAllButCurrent<cr>", "Close all but current tab" },
    ["<A-q>"]    = { "<cmd>%bd<cr>"                     , "Close all tabs" },
    ["<A-n>"]    = { "<cmd>Alpha<cr>"                   , "Open alpha" },
    ["<Esc>"]    = { ":noh<Esc>"                        , "Esc removing highlight"},
    ["q:"]       = { "<nop>"                            , "Disabled"},
    ["<F3>"]     = { "<cmd>Autoformat<CR>"              , "Autoformat file" },
    Q            = { "<nop>"                            , "Disabled"},
  })

wk.register({
    [">"]        = { ">gv", "Indent selection" },
    ["<"]        = { "<gv", "Remove indent selection" },
    ["<A-k>"]    =          "Move selection up",
    ["<A-Up>"]   =          "Move selection up",
    ["<A-j>"]    =          "Move selection down",
    ["<A-Down>"] =          "Move selection down",
  }, { mode = "v" })

wk.register({
    ["<A-k>"]    = { "<Esc>:m .-2<CR>==gi", "Move line up" },
    ["<A-Up>"]   = { "<Esc>:m .-2<CR>==gi", "Move line up" },
    ["<A-j>"]    = { "<Esc>:m .+1<CR>==gi", "Move line down" },
    ["<A-Down>"] = { "<Esc>:m .+1<CR>==gi", "Move line down" },
  }, { mode = "i" })

wk.register({
    ["<leader>,"] = { "<cmd>BufferNext<cr>"                       , "Tab next"} ,
    ["<leader>."] = { "<cmd>BufferPrevious<cr>"                   , "Tab previous"} ,
    ["<leader>'"] = { "<cmd>call ChooseTerm('term-slider', 1)<cr>", "Terminal"} ,
    ["<leader>C"] =                                                 "Toggle cheatsheet comments",
  })

wk.register({
    b = {
      name = "buffers"                            ,
      o    = { "<cmd>BufferCloseAllButCurrent<cr>", "Buffer only" },
      b    = { "<cmd>Buffers<cr>"                 , "Buffer fuzzy-find" },
      a    = { "<cmd>%bd<cr>"                     , "Buffer close-all" },
      n    = { "<cmd>BufferNext<cr>"              , "Buffer next" },
      p    = { "<cmd>BufferPrevious<cr>"          , "Buffer previous" },
      d    = { "<cmd>bp | bd #<cr>"               , "Buffer delete" },
      t    = { "<cmd>bdelete! term-slider<cr>"    , "Buffer terminal-delete" },
      l    = { "<cmd>buffers<cr>"                 , "Buffer list-all" },
      s    = { "<cmd>w<cr>"                       , "Buffer save" },
      c    = { ":b "                              , "Buffer command"}
    }
  }, { prefix = "<leader>" })

wk.register({
    c = {
      name = "coc"                                      ,
      c    = { "<cmd>CocCommand<cr>"                    , "Coc command" },
      d    = { "<cmd>CocList diagnostics<cr>"           , "Coc show all diagnostics" },
      e    = { "<cmd>CocList extensions<cr>"            , "Coc manage extensions" },
      f    = { "<cmd>CocCommand prettier.formatFile<cr>", "Coc format file" },
      l    = { "<cmd>CocList<cr>"                       , "Coc list" },
      o    = { "<cmd>CocList outline<cr>"               , "Coc outline" },
      s    = { "<cmd>CocList -I symbols<cr>"            , "Coc search symbols" },
      j    = { "<cmd>CocNext<cr>"                       , "Coc action previous" },
      k    = { "<cmd>CocPrev<cr>"                       , "Coc action next" },
      r    = { "<Plug>(coc-range-select)"               , "Coc range select" },
    }
  }, { prefix = "<leader>" })

-- wk.register({
--     c = {
--       name = "C",
--       d = { ":cd %:p:h<CR>:pwd<CR>", "Change workdir" }
--     }
--   }, { prefix = "<leader>" })

wk.register({
    f = {
      name = "fzf"               ,
      f    = { "<cmd>Files<cr>"  , "Files" },
      g    = { "<cmd>GFiles<cr>" , "Git files" },
      h    = { "<cmd>History<cr>", "Recent files" },
      r    = { "<cmd>Rg<cr>"     , "Search text on files" },
      l    = { "<cmd>Lines<cr>"  , "Search text on open files"}
    }
  }, { prefix = "<leader>" })

wk.register({
    K = {
      name = "cheatsheet",
      K    = "not working!",
      B    = "awnser on-buffer",
      R    = "awnser replace",
      P    = "awnser below",
      C    = "toggle last-comment",
      E    = "send error",
      L    = "last query",
    }
  }, { prefix = "<leader>" })

wk.register({
    o = {
      name = "toggle",
      t    = { "<cmd>call ChooseTerm('term-slider', 1)<cr>" , "Terminal split" },
      s    = { "<cmd>setlocal spell! spelllang=en_us,pt<cr>", "Spellcheck" },
      p    = { "<cmd>NvimTreeToggle<cr>"               , "File tree" },
      l    = { "<cmd>set list!<cr>"                         , "List chars" },
      n    = { "<cmd>set relativenumber!<cr>"               , "Relativenumber" },
      i    = { "<cmd>IndentBlanklineToggle<cr>"             , "Toggle indentline" }
    }
  }, { prefix = "<leader>" })

wk.register({
    t = {
      name = "terminal"                                                     ,
      T    = { "<cmd>call ChooseTerm('term-slider', 1)<cr>"                 , "Terminal" },
      f    = { "<cmd>FloatermNew fzf<cr>"                                   , "Fzf" },
      g    = { "<cmd>FloatermNew lazygit<cr>"                               , "Git" },
      d    = { "<cmd>FloatermNew lazydocker<cr>"                            , "Docker" },
      n    = { "<cmd>FloatermNew node<cr>"                                  , "Node" },
      p    = { "<cmd>FloatermNew python<cr>"                                , "Python" },
      m    = { "<cmd>FloatermNew lazynpm<cr>"                               , "Npm" },
      t    = { "<cmd>FloatermToggle<cr>"                                    , "Toggle" },
      s    = { "<cmd>FloatermNew gotop<cr>"                                 , "Gotop" },
      h    = { "<cmd>FloatermNew ncdu<cr>"                                  , "Ncdu" },
      r    = { "<cmd>FloatermNew --width=0.99 --height=0.99 /bin/ranger<cr>", "Ranger" },
    }
  }, { prefix = "<leader>" })

wk.register({
    v = {
      name = "vim"                                      ,
      q    = { "<cmd>qa!<cr>"                           , "Exit vim" },
      c    = { "<cmd>wqa<cr>"                           , "Save and exit" },
      s    = { "<cmd>wa<cr>"                            , "Save all files" },
      r    = { "<cmd>source ~/.config/nvim/init.lua<cr>", "Reload source" },
    }
  }, { prefix = "<leader>" })

wk.register({
    w = {
      name        = "window"              ,
      w           = { "<C-W>W"            , "Move to other window" },
      d           = { "<C-W>c"            , "Delete window" },
      s           = { "<C-W>s"            , "Split window below" },
      v           = { "<C-W>v"            , "Split window aside" },
      k           = { "<C-W>k"            , "Move above" },
      l           = { "<C-W>l"            , "Move right" },
      j           = { "<C-W>j"            , "Move below" },
      h           = { "<C-W>h"            , "Move left" },
      H           = { "<C-W>5<"           , "Expand window left" },
      J           = { "<cmd>resize +5<cr>", "Expand window below" },
      L           = { "<C-W>5>"           , "Expand window right" },
      K           = { "<cmd>resize -5<cr>", "Expand window up" },
      ["="]       = { "<C-W>="            , "Balance window" },
      ["-"]       = { "<C-W>_"            , "Maximaze window" },
      q           = { "ZQ"                , "Close window" },
      c           = { "ZZ"                , "Save and close window" },
      ["<Up>"]    = { "<C-W>k"            , "Move above" },
      ["<Right>"] = { "<C-W>l"            , "Move right" },
      ["<Down>"]  = { "<C-W>j"            , "Move below" },
      ["<Left>"]  = { "<C-W>h"            , "Move left" },
    }
  }, { prefix = "<leader>" })



-- Can't map these
vim.cmd([[
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : (&filetype == "floaterm") ? "<Esc>" : "<c-\><c-n>"
  ]])
map('t', '<C-v><Esc>', '<c-\\><c-n>', nrmp)

map('v', '', 'gcgv', {})  -- comment area
map('n', '', 'gcc', {}) -- comment line

map('v', '<A-k>', ":m '<-2<CR>gv=gv", nrmp) -- move selection up
map('v', '<A-Up>', ":m '<-2<CR>gv=gv", nrmp) -- move selection up
map('v', '<A-j>', ":m '>+1<CR>gv=gv", nrmp) -- move selection down
map('v', '<A-Down>', ":m '>+1<CR>gv=gv", nrmp) -- move selection down
