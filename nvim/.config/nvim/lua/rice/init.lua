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
  create("IndentBlanklineIndent1", { guifg='#7e444f', gui='nocombine' }, false)
  create("IndentBlanklineIndent2", { guifg='#816e52', gui='nocombine' }, false)
  create("IndentBlanklineIndent3", { guifg='#5a7051', gui='nocombine' }, false)
  create("IndentBlanklineIndent4", { guifg='#396975', gui='nocombine' }, false)
  create("IndentBlanklineIndent5", { guifg='#3f668c', gui='nocombine' }, false)
  create("IndentBlanklineIndent6", { guifg='#714a83', gui='nocombine' }, false)

  create('NonText', { guifg='#44475a' }, false)
  create('CursorLine', { guibg='#282a37' }, false)
  create('Normal', { guibg='#1c1c28' }, false)
  create('EndOfBuffer', { guifg='#1c1c28' }, false) --remove end of buffer ~
  create('VertSplit', { guibg="#1c1c28", guifg="#1c1c28" }, false)

  create('BufferTabpageFill', { guibg='#13141a', guifg='#13141a' }, true)
  create('BufferInactive', { guibg='#13141a', guifg='#44475a' }, true)
  create('BufferInactiveSign', { guibg='#13141a', guifg='#13141a' })
  create('BufferCurrentSign', { guibg='#1c1c28', guifg='#1c1c28' })
  create('BufferVisibleSign', { guibg='#1c1c28', guifg='#1c1c28' })

  create("BufferInactiveMod", { guibg='#13141a', guifg='#f1fa8c' }, false)
  create("BufferVisibleMod", { guifg='#6272a4' }, false)
  create("BufferCurrentMod", { guifg='#ffb86c' }, false)
  create("CocExplorer", { guibg='#13141a' })


  link('QuickScopeSecondary', 'DraculaLink', true)
end

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

link('QuickScopePrimary', 'MatchParen', true)
