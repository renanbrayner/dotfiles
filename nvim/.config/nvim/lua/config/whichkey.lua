local wk = require("which-key")

--- ATENTION ---
-- Some mappings are in the ~/.config/nvim/init.vim file

wk.setup({
    window = {
      border = "single",
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
    ["<C-p>"]    = { "<cmd>call ControlP()<cr>"     , "search-files"},
    ["<C-s>"]    = { "<cmd>:w<cr>"                  , "save-file" },
    ["<A-Up>"]   = { "<cmd>m .-2<CR>=="             , "move-line-up"},
    ["<A-k>"]    = { "<cmd>m .-2<CR>=="             , "move-line-up"},
    ["<A-Down>"] = { "<cmd>m .+1<CR>=="             , "move-line-down"},
    ["<A-j>"]    = { "<cmd>m .+1<CR>=="             , "move-line-down"},
    ["<A-,>"]    = { "<cmd>BufferPrevious<CR>"          , "previous-buffer"},
    ["<A-.>"]    = { "<cmd>BufferNext<CR>"              , "next-buffer"},
    ["<A-<>"]    = { "<cmd>BufferMovePrevious<CR>"      , "move-buffer-previous"},
    ["<A->>"]    = { "<cmd>BufferMoveNext<CR>"         , "move-buffer-next"},
    ["<A-1>"]    = { "<cmd>BufferGoto 1<CR>"            , "go-to-buffer-1"},
    ["<A-2>"]    = { "<cmd>BufferGoto 2<CR>"            , "go-to-buffer-2"},
    ["<A-3>"]    = { "<cmd>BufferGoto 3<CR>"            , "go-to-buffer-3"},
    ["<A-4>"]    = { "<cmd>BufferGoto 4<CR>"            , "go-to-buffer-4"},
    ["<A-5>"]    = { "<cmd>BufferGoto 5<CR>"            , "go-to-buffer-5"},
    ["<A-6>"]    = { "<cmd>BufferGoto 6<CR>"            , "go-to-buffer-6"},
    ["<A-7>"]    = { "<cmd>BufferGoto 7<CR>"            , "go-to-buffer-7"},
    ["<A-8>"]    = { "<cmd>BufferGoto 8<CR>"            , "go-to-buffer-8"},
    ["<A-9>"]    = { "<cmd>BufferGoto 9<CR>"            , "go-to-buffer-9"},
    ["<A-0>"]    = { "<cmd>BufferLast<CR>"              , "go-to-last-buffer"},
    ["<A-c>"]    = { "<cmd>BufferClose<CR>"             , "close-buffer"},
  })

wk.register({
    ["<leader>,"] = { "<cmd>BufferNext<cr>"              , "tab-next"} ,
    ["<leader>."] = { "<cmd>BufferPrevious<cr>"              , "tab-previous"} ,
    ["<leader>'"] = { "<cmd>call ChooseTerm('term-slider', 1)<cr>" , "terminal"} ,
    ["<leader>C"] = "toggle-cheatsheet-comments"                   ,
  })

wk.register({
    ["<A-k>"] = "move-selection-up",
    ["<A-Up>"] = "move-selection-up",
    ["<A-j>"] = "move-selection-down",
    ["<A-Down>"] = "move-selection-down",
  }, { mode = "v" })

wk.register({
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "move-line-up" },
    ["<A-Up>"] = { "<Esc>:m .-2<CR>==gi", "move-line-up" },
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "move-line-down" },
    ["<A-Down>"] = { "<Esc>:m .+1<CR>==gi", "move-line-down" },
  }, { mode = "i" })

wk.register({
    b = {
      name = "buffers"                        ,
      o    = { "<cmd>BufferCloseAllButCurrent<cr>"          , "buffer-only" },
      b    = { "<cmd>Buffers<cr>"             , "buffer-fuzzy-find" },
      n    = { "<cmd>BufferNext<cr>", "buffer-next" },
      p    = { "<cmd>BufferPrevious<cr>", "buffer-previous" },
      d    = { "<cmd>bp | bd #<cr>"           , "buffer-delete" },
      t    = { "<cmd>bdelete! term-slider<cr>", "buffer-terminal-delete" },
      l    = { "<cmd>buffers<cr>"             , "buffer-list-all" },
      s    = { "<cmd>w<cr>"                   , "buffer-save" },
      c    = { ":b "                          , "buffer-command"}
    }
  }, { prefix = "<leader>" })

wk.register({
    c = {
      name = "coc"                                      ,
      c    = { "<cmd>CocCommand<cr>"                    , "Coc-command" },
      d    = { "<cmd>CocList diagnostics<cr>"           , "Coc-show-all-diagnostics" },
      e    = { "<cmd>CocList extensions<cr>"            , "Coc-manage-extensions" },
      f    = { "<cmd>CocCommand prettier.formatFile<cr>", "Coc-format-file" },
      l    = { "<cmd>CocList<cr>", "Coc-list" }         ,
      o    = { "<cmd>CocList outline<cr>"               , "Coc-outline" },
      s    = { "<cmd>CocList -I symbols<cr>"            , "Coc-search-symbols" },
      j    = { "<cmd>CocNext<cr>"                       , "Coc-action-previous" },
      k    = { "<cmd>CocPrev<cr>"                       , "Coc-action-next" },
      r    = { "<Plug>(coc-range-select)"               , "Coc-range-select" },
    }
  }, { prefix = "<leader>" })

wk.register({
    K = {
      name = "cheatsheet",
      K    = "not-working!",
      B    = "awnser-on-buffer",
      R    = "awnser-replace",
      P    = "awnser-below",
      C    = "toggle-last-comment",
      E    = "send-error",
      L    = "last-query",
    }
  }, { prefix = "<leader>" })

wk.register({
    o = {
      name = "toggle",
      t    = { "<cmd>call ChooseTerm('term-slider', 1)<cr>" , "terminal-split" },
      s    = { "<cmd>setlocal spell! spelllang=en_us,pt<cr>", "spellcheck" },
      p    = { "<cmd>CocCommand explorer<cr>"               , "file-tree" },
      l    = { "<cmd>set list!<cr>"                         , "list-chars" },
      n    = { "<cmd>set relativenumber!<cr>"               , "relativenumber" },
    }
  }, { prefix = "<leader>" })

wk.register({
    t = {
      name = "terminal"                                                     ,
      T    = { "<cmd>call ChooseTerm('term-slider', 1)<cr>"                 , "terminal" },
      f    = { "<cmd>FloatermNew fzf<cr>"                                   , "fzf" },
      g    = { "<cmd>FloatermNew lazygit<cr>"                               , "git" },
      d    = { "<cmd>FloatermNew lazydocker<cr>"                            , "docker" },
      n    = { "<cmd>FloatermNew node<cr>"                                  , "node" },
      p    = { "<cmd>FloatermNew python<cr>"                                , "python" },
      m    = { "<cmd>FloatermNew lazynpm<cr>"                               , "npm" },
      t    = { "<cmd>FloatermToggle<cr>"                                    , "toggle" },
      s    = { "<cmd>FloatermNew gotop<cr>"                                 , "gotop" },
      h    = { "<cmd>FloatermNew ncdu<cr>"                                  , "ncdu" },
      r    = { "<cmd>FloatermNew --width=0.99 --height=0.99 /bin/ranger<cr>", "ranger" },
    }
  }, { prefix = "<leader>" })

wk.register({
    v = {
      name = "vim"                                      ,
      q    = { "<cmd>qa!<cr>"                           , "vim-exit" },
      c    = { "<cmd>wqa<cr>"                           , "vim-save-and-exit" },
      s    = { "<cmd>wa<cr>"                            , "vim-save" },
      r    = { "<cmd>source ~/.config/nvim/init.vim<cr>", "vim-reload-source" },
    }
  }, { prefix = "<leader>" })

wk.register({
    f = {
      name = "fzf",
      f    = { "<cmd>Files<cr>", "files" },
      g    = { "<cmd>GFiles<cr>", "git-files" },
      h    = { "<cmd>History<cr>", "recent-files" },
      r    = { "<cmd>Rg<cr>", "text" },
    }
  }, { prefix = "<leader>" })

wk.register({
    w = {
      name        = "window"              ,
      w           = { "<C-W>W"            , "other-window" },
      d           = { "<C-W>c"            , "delete-window" },
      s           = { "<C-W>s"            , "split-window-below" },
      v           = { "<C-W>v"            , "split-window-aside" },
      k           = { "<C-W>k"            , "window-above" },
      l           = { "<C-W>l"            , "window-right" },
      j           = { "<C-W>j"            , "window-below" },
      h           = { "<C-W>h"            , "window-left" },
      H           = { "<C-W>5<"           , "expand-window-left" },
      J           = { "<cmd>resize +5<cr>", "expand-window-below" },
      L           = { "<C-W>5>"           , "expand-window-right" },
      K           = { "<cmd>resize -5<cr>", "expand-window-up" },
      ["="]       = { "<C-W>="            , "balance-window" },
      ["-"]       = { "<C-W>_"            , "maximaze-window" },
      q           = { "ZQ"                , "close-window" },
      c           = { "ZZ"                , "save-and-close-window" },
      ["<Up>"]    = { "<C-W>k"            , "window-above" },
      ["<Right>"] = { "<C-W>l"            , "window-right" },
      ["<Down>"]  = { "<C-W>j"            , "window-below" },
      ["<Left>"]  = { "<C-W>h"            , "window-left" },
    }
  }, { prefix = "<leader>" })

wk.register({
    c = {
      name = "C",
      d = { ":cd %:p:h<CR>:pwd<CR>", "change-workdir" }
    }
  }, { prefix = "<leader>" })
