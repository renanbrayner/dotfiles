local devicons = require("nvim-web-devicons")

local override = {
  ["vue"] = {
    -- icon = "﵂﵂",
    -- color = "#428850",
    icon = "﵂﵂",
    color = "#428850",
    cterm_color = "65",
    name = "Vue"
  },
}
devicons.setup {
  default = true,
}
