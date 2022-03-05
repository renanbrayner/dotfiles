vim.g.indent_blankline_filetype_exclude = { 'alpha', 'coc-explorer', 'help', 'packer' }

vim.opt.list = true
vim.opt.listchars:append("space:·")
-- vim.opt.listchars:append("eol:﬋")
vim.opt.listchars:append("trail:")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
