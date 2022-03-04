local create = vim.highlight.create
local link = vim.highlight.link
local set = vim.opt

vim.cmd([[
    colorscheme dracula

    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
  ]])

set.cursorline = true
set.showmode = false
set.termguicolors = true

link('QuickScopePrimary', 'MatchParen', true)
link('QuickScopeSecondary', 'DraculaLink', true)

create('NonText', { guifg='#44475a' }, false)
create('CursorLine', { guibg='#282a37' }, false)
create('Normal', { guibg='#1c1c28' }, false)
create('EndOfBuffer', { guifg='#1c1c28' }, false) --remove end of buffer ~

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

create("BufferInactiveMod", { guifg='#f1fa8c' }, false)
create("BufferVisibleMod", { guifg='#6272a4' }, false)
create("BufferCurrentMod", { guifg='#ffb86c' }, false)

create("IndentBlanklineIndent1", { guifg='#7e444f', gui='nocombine' }, false)
create("IndentBlanklineIndent2", { guifg='#816e52', gui='nocombine' }, false)
create("IndentBlanklineIndent3", { guifg='#5a7051', gui='nocombine' }, false)
create("IndentBlanklineIndent4", { guifg='#396975', gui='nocombine' }, false)
create("IndentBlanklineIndent5", { guifg='#3f668c', gui='nocombine' }, false)
create("IndentBlanklineIndent6", { guifg='#714a83', gui='nocombine' }, false)
