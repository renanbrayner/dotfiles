local create = vim.highlight.create
local link = vim.highlight.link
local set = vim.opt

vim.cmd"colorscheme dracula"

vim.cmd([[
    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
  ]])

set.cursorline = true
set.showmode = false
set.termguicolors = true


-- Meaning of terms:
--
-- format: "Buffer" + status + part
--
-- status:
--     *Current: current buffer
--     *Visible: visible but not current buffer
--    *Inactive: invisible but not current buffer
--
-- part:
--        *Icon: filetype icon
--       *Index: buffer index
--         *Mod: when modified
--        *Sign: the separator between buffers
--      *Target: letter in buffer-picking mode
--
-- BufferTabpages: tabpage indicator
-- BufferTabpageFill: filler after the buffer section
-- BufferOffset: offset section, created with set_offset()

-- DRACULA ONLY
if vim.g.colors_name == "dracula" then
  local dracula = {
    fr = '#f8f8f2',
    cmt = '#6272a4',
    cya = '#8be9fd',
    grn = '#50fa7b',
    org = '#ffb86c',
    pnk = '#ff79c6',
    pur = '#bd93f9',
    red = '#ff5555',
    ylw = '#f1fa8c',
    -- These are different from the original
    bg = '#282a37',
    curli = '#363847',
    ntxt = '#44475a',
    dark = '#21222c',
    darker = '#1c1d26',
  }

  -- General configs
  create('NonText', { guifg=dracula.ntxt }, false)
  create('CursorLine', { guibg=dracula.curli}, false)
  create('Normal', { guibg=dracula.bg }, false)
  create('EndOfBuffer', { guifg=dracula.bg }, false) --remove end of buffer ~
  create('VertSplit', { guibg=dracula.bg, guifg=dracula.bg }, false)

  -- Indent lines
  create("IndentBlanklineIndent1", { guifg='#7e444f', gui='nocombine' }, false)
  create("IndentBlanklineIndent2", { guifg='#816e52', gui='nocombine' }, false)
  create("IndentBlanklineIndent3", { guifg='#5a7051', gui='nocombine' }, false)
  create("IndentBlanklineIndent4", { guifg='#396975', gui='nocombine' }, false)
  create("IndentBlanklineIndent5", { guifg='#3f668c', gui='nocombine' }, false)
  create("IndentBlanklineIndent6", { guifg='#714a83', gui='nocombine' }, false)

  -- Barbar
  create('BufferTabpageFill', { guibg=dracula.darker, guifg=dracula.darker }, true)
  create('BufferInactive', { guibg=dracula.dark, guifg=dracula.ntxt }, true)
  create('BufferInactiveSign', { guibg=dracula.dark, guifg=dracula.dark })
  create("BufferInactiveMod", { guibg=dracula.dark, guifg=dracula.ylw }, false)
  create('BufferVisible', { guifg=dracula.cmt })
  create('BufferVisibleSign', { guibg=dracula.bg, guifg=dracula.bg })
  create("BufferVisibleMod", { guifg=dracula.ylw }, false)
  create('BufferCurrentSign', { guibg=dracula.bg, guifg=dracula.bg })
  create("BufferCurrentMod", { guifg=dracula.org }, false)

  -- Tree explorers
  create("MyExplorer", { guibg=dracula.darker })
  create("NvimTreeNormal", { guibg=dracula.darker }, false)

  -- Git symbols at the side
  create("SignifySignDelete", { guifg=dracula.red, gui='NONE' })

  -- FfTt
  link('QuickScopeSecondary', 'DraculaLink', true)

  -- Fzf (SpellLocal = orange)
  vim.g["fzf_colors"] = {
    ['fg+'] = {'fg', 'Normal', 'CursorColumn', 'Normal'},
    ['bg+'] = {'bg', 'Normal', 'CursorColumn'},
    ['hl+'] = {'fg', 'SpellLocal'},
    fg = {'fg', 'Normal'},
    bg = {'bg', 'Normal'},
    hl = {'fg', 'Function'},
    info = {'fg', 'PreProc'},
    border = {'fg', 'Comment'},
    prompt = {'fg', 'Function'},
    pointer = {'fg', 'Exception'},
    marker = {'fg', 'Keyword'},
    spinner = {'fg', 'Label'},
    header = {'fg', 'Comment'}
  }
else
  -- Not dracula
  create("IndentBlanklineIndent1", { guifg='#E06C75', gui='nocombine' }, false)
  create("IndentBlanklineIndent2", { guifg='#E5C07B', gui='nocombine' }, false)
  create("IndentBlanklineIndent3", { guifg='#98C379', gui='nocombine' }, false)
  create("IndentBlanklineIndent4", { guifg='#56B6C2', gui='nocombine' }, false)
  create("IndentBlanklineIndent5", { guifg='#61AFEF', gui='nocombine' }, false)
  create("IndentBlanklineIndent6", { guifg='#C678DD', gui='nocombine' }, false)
end

-- Every theme
link('QuickScopePrimary', 'MatchParen', true)
