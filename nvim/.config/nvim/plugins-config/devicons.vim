lua << EOF
require'nvim-web-devicons'.setup {
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 default = true;
}

require'nvim-web-devicons'.get_icons()
EOF
