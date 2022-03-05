local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- opts
-- dashboard.config.opts = {
--   noautocmd = false
-- }

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button( "f", "  Find file", ":call ControlP()<CR>"),
  dashboard.button( "r", "  Recent"   , ":History<CR>"),
  dashboard.button( "l", "  Load Last session", ":SessionManager load_last_session<CR>"),
  dashboard.button( "s", "  Load session", ":SessionManager load_session<CR>"),
  -- dashboard.button( "m", "  Bookmarks", ":Marks <CR>"),
  dashboard.button( "c", "  Configuration" , ":e $MYVIMRC<CR>:cd %:p:h<CR>:pwd<CR>"),
  dashboard.button( "e", "  New file" , ":ene<CR>"),
  dashboard.button( "q", "  Quit NVIM", ":qa<CR>"),
}

-- Set footer
local function footer()
  local plugins = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y"
  return string.format(" %s   v%s.%s.%s  %s", plugins, v.major, v.minor, v.patch, datetime)
end

dashboard.section.footer.val = footer()

-- Disable folding on alpha buffer
vim.cmd([[
autocmd FileType alpha setlocal nofoldenable
autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
]])
-- Add this to vim.cmd to disable tabline on alpha

-- Set header
-- dashboard.section.header.val = {
--     "                                                   ",
--     "███╗   ██╗ ██████╗ ████████╗██╗   ██╗██╗███╗   ███╗",
--     "████╗  ██║██╔═══██╗╚══██╔══╝██║   ██║██║████╗ ████║",
--     "██╔██╗ ██║██║   ██║   ██║   ██║   ██║██║██╔████╔██║",
--     "██║╚██╗██║██║   ██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║",
--     "██║ ╚████║╚██████╔╝   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
--     "╚═╝  ╚═══╝ ╚═════╝    ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
--     "                                                   ",
-- }

-- dashboard.section.header.val = {
--     "    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ⣿⢸⣿⣿⣿⣿⣿⢹⣿⣿⣿⣿⣿⢿⣿⡇⡇⣿⣿⡇⢹⣿⣿⣿⣿⣿⣿⠄⢸⣿ ⢰⡟⣡⡟⣱⣿⡿⠡⢛⣋⣥⣴⣌⢿⣿⣿⣿⣿⣷⣌⠻⢿⣿⣿⣿⣿⣿⣿",
--     "    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ⡟⢸⣿⣿⣭⣭⡭⣼⣶⣿⣿⣿⣿⢸⣧⣇⠇⢸⣿⣿⠈⣿⣿⣿⣿⣿⣿⡆⠘⣿ ⠏⢼⡿⣰⡿⠿⠡⠿⠿⢯⣉⠿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣦⣍⠻⢿⣿⣿⣿",
--     "   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ⡇⢸⣿⣿⣿⣿⡇⣻⡿⣿⣿⡟⣿⢸⣿⣿⠇⡆⣝⠿⡌⣸⣿⣿⣿⣿⣿⡇⠄⣿ ⣼⣷⢠⠀⠀⢠⣴⡖⠀⠀⠈⠻⣿⡿⣿⣿⣿⣿⣿⣛⣯⣝⣻⣿⣶⣿⣿⣿",
--     "   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ⢣⢾⣾⣷⣾⣽⣻⣿⣇⣿⣿⣧⣿⢸⣿⣿⡆⢸⣹⣿⣆⢥⢛⡿⣿⣿⣿⡇⠄⣿ ⣿⡇⣿⡷⠂⠈⡉⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣍⡤⣤⣤⣤⡀⠀⠉⠛⠿",
--     "  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿                                                       ⣿⣿⣿⣿⣿⣟⡭⡄⣀⣉⡀⠀⠀⠀⠀",
--     "  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿  ███╗   ██╗ ██████╗ ████████╗██╗   ██╗██╗███╗   ███╗  ⣿⣿⣿⣿⣿⣿⣿⣶⣦⣈⠀⠀⠀⢀⣶",
--     " ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿  ████╗  ██║██╔═══██╗╚══██╔══╝██║   ██║██║████╗ ████║  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿",
--     " ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿  ██╔██╗ ██║██║   ██║   ██║   ██║   ██║██║██╔████╔██║  ⣻⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿",
--     " ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿  ██║╚██╗██║██║   ██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║  ⠈⠉⠙⠻⠏⠛⠻⣿⣿⣿⣿⣿⣭⡾⢁",
--     " ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈  ██║ ╚████║╚██████╔╝   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║  ⢀⣠⣀⣀⠀⠀⣼⣿⣿⣿⣿⣿⠟⣁⠉",
--     "  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀  ╚═╝  ╚═══╝ ╚═════╝    ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝  ⣿⣿⣿⠿⣡⣾⣿⣿⣿⣿⡿⠋⠐⢡⣶",
--     "   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾                                                       ⢟⣋⣤⣾⣿⣿⣿⡿⠟⣩⠖⢠⡬⠈⠀",
--     "     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ⣿⣿⣇⢽⣿⣿⣿⡏⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⡿⣿⣛⣻⠿⣟⣼⣿⣿⣿⣿⢃ ⣿⣧⠁⢻⡇⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁⢀⠈⢀⡴⠈⠁⠀⠤",
--     "        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ⣿⣿⣿⡎⣷⣽⠻⣇⣿⣿⣿⡿⣟⣵⣿⣟⣽⣾⣿⣿⣿⣿⢯⣾⣿⣿⣿⠟⠱⡟ ⠻⣿⣆⠘⣿⠀⠀  ⠀⠈⠙⠛⠋⠉⠀⠀⠀⠀⡀⠤⠚⠁     ",
--     " ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ⣿⣿⣿⣿⢹⣿⣿⢮⣚⡛⠒⠛⢛⣋⣶⣿⣿⣿⣿⣿⣟⣱⠿⣿⣿⠟⣡⣺⠋     ⠁ ⠁            ⠈        ⣠",
-- }

-- dashboard.section.header.val = {
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--     "⣿⣿⡏⠉⠉⠉⠉⠉⠉⠉⠉⠉⣿⡏⠉⣿⡏⠉⣿⠉⢹⣿⣿⣿⣿⠉⣿⡏⠉⠉⠉⠉⠉⠉⠉⠉⠉⢹⣿⣿",
--     "⣿⣿⡇⠀⣿⠛⠛⠛⠛⢻⣿⠀⣿⡟⠛⠀⠀⠀⣤⣤⡜⠛⠛⠛⠛⣿⣿⡇⠀⣿⡟⠛⠛⠛⢻⣿⠀⢸⣿⣿",
--     "⣿⣿⡇⠀⣿⠀⠀⠀⠀⢸⣿⠀⣿⡇⠀⠀⠀⠀⣿⠉⠁⠀⠀⢰⣶⣿⣿⡇⠀⣿⡇⠀⠀⠀⢸⣿⠀⢸⣿⣿",
--     "⣿⣿⡇⠀⣿⣀⣀⣀⣀⣸⣿⠀⣿⣇⣀⣿⡿⠿⠀⣀⣸⣿⣿⣇⣀⣀⣿⡇⠀⣿⣇⣀⣀⣀⣸⣿⠀⢸⣿⣿",
--     "⣿⣿⡇⠀⠛⠛⠛⠛⠛⠛⠛⠀⣿⡟⠛⣿⡇⠀⣤⠛⢻⣿⠛⢻⣿⠛⣿⡇⠀⠛⠛⠛⠛⠛⠛⠛⠀⢸⣿⣿",
--     "⣿⣿⡿⠿⠿⠿⠿⠿⣿⣿⣿⠿⣿⡿⠿⣿⡇⠀⠿⠀⢸⣿⣀⡸⠿⣿⠿⢿⣿⣿⡿⠿⠿⠿⢿⣿⠿⢿⣿⣿",
--     "⣿⣿⡇⠀⠀⣤⣤⣤⣿⣿⣿⣤⠛⠃⠀⣿⡇⠀⣤⠀⠘⠛⣿⣧⣤⠛⣤⣼⣿⠛⢣⣤⣤⣤⡜⠛⣤⣼⣿⣿",
--     "⣿⣿⡇⠀⠀⣿⡏⠉⣿⣿⣿⠉⣶⡆⠀⠉⠁⠀⠉⠀⠀⠀⣿⣿⣿⠀⣿⡏⠉⠀⠈⠉⣿⣿⣷⣶⣿⣿⣿⣿",
--     "⣿⣿⡟⠛⣤⠛⠛⠛⣤⡜⠛⠛⣤⡜⠛⠀⠀⠀⣿⠛⠃⠀⠛⠛⠛⣤⠛⠃⠀⣿⡟⠛⣤⠀⠘⠛⠛⢻⣿⣿",
--     "⣿⣿⣷⣶⣿⠀⠀⠀⠉⢱⣶⣶⣿⣷⣶⠀⢰⣶⠉⠀⢰⣶⠀⠀⠀⠉⠀⠀⠀⠉⠁⠀⣿⣶⣶⣶⠀⢸⣿⣿",
--     "⣿⣿⡿⠿⣀⠀⠸⠿⠀⢀⣀⣀⣿⡇⠀⣀⡀⠀⠀⣿⣿⣿⠿⢿⣿⣀⠿⠿⠿⣀⣀⣀⠿⣀⣀⣀⠿⢿⣿⣿",
--     "⣿⣿⣧⣤⣿⠀⠀⠀⣤⡜⠛⠛⠛⠃⠀⣿⡇⠀⣤⠛⠛⠛⣤⣼⣿⠛⠀⠀⠀⠛⠛⠛⠀⠛⠛⠛⠀⢸⣿⣿",
--     "⣿⣿⡿⠿⠿⠿⠿⠿⠿⠿⠿⠿⣿⣇⣀⠿⠇⠀⣿⣿⡿⠿⠿⢇⣀⠀⣿⡿⠿⣿⡇⠀⠿⠿⠿⠿⠀⢸⣿⣿",
--     "⣿⣿⡇⠀⣤⣤⣤⣤⣤⣤⣤⠀⣿⣿⣿⣤⡄⠀⠛⣿⣧⣤⣤⡜⠛⠀⣿⣧⣤⣿⡇⠀⣤⣤⣤⣤⠀⢸⣿⣿",
--     "⣿⣿⡇⠀⣿⠉⠉⠉⠉⢹⣿⠀⣿⣿⣿⠉⠁⠀⣶⣿⣿⣿⠉⢱⣶⠀⠉⠉⠉⠉⠁⠀⣿⣿⡏⠉⣶⣾⣿⣿",
--     "⣿⣿⡇⠀⣿⠀⠀⠀⠀⢸⣿⠀⣿⡇⠀⣤⣤⣤⣿⣿⣧⣤⣿⣧⣤⣤⠀⠀⠀⠀⠀⠀⠛⠀⠀⠀⣤⣼⣿⣿",
--     "⣿⣿⡇⠀⣿⣶⣶⣶⣶⣾⣿⠀⣿⡇⠀⣿⣿⣿⠉⠉⠉⠉⠉⢹⣿⣿⠀⠀⠀⣶⡆⠀⣶⠀⢰⣶⣿⣿⣿⣿",
--     "⣿⣿⣇⣀⣀⣀⣀⣀⣀⣀⣀⣀⣿⣇⣀⣿⣿⣿⣀⣀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣀⣀⣀⣀⣀⣀⣀⣀⣸⣿⣿",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
-- }

-- dashboard.section.header.val = {
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣖⡀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⡟⠃⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⡰⠋⠜⠋⣾⡟⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⢈⣠⣴⣶⡶⠚⠛⠉⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⠉⠉⠉⠁⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠘⣿⣏⠉⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⡿⠛⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡉⡳⢿⣿⡆⠀⠰⢫⠝⠒⡂⠄⡲⠶⠒⠒⠀⣿⣿⣿⣿⠁⣦⡆⠘⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣍⢩⣿⣿⠁⠀⠀⠉⠁⢤⡌⠁⠙⡄⠀⠀⢠⣿⣿⣿⣿⣄⡻⣿⠇⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⣳⣿⣿⣟⢛⣿⡟⢠⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⣔⡯⠞⡋⡈⠛⠛⢠⣾⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⣶⣶⣿⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢲⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⠂⢰⡿⢿⣏⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣷⣤⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⡟⠁⠀⠈⠻⢦⣝⠊⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⣠⣤⣶⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣠⣤⣶⣽⣻⢿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣝⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠈⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣯⣶⣄⠀⠀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⡿⣻⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣤⣴⣶⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
-- }

-- dashboard.section.header.val = {
--     "=================     ===============     ===============   ========  ========",
--     "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
--     "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
--     "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
--     "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
--     "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
--     "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
--     "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
--     "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
--     "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
--     "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
--     "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
--     "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
--     "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
--     "||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||",
--     "||.=='    _-'                                                     `' |  /==.||",
--     "=='    _-'                        N E O V I M                         \\/   `==",
--     "\\   _-'                                                                `-_   /",
--     " `''                                                                      ``' ",
-- }


-- dashboard.section.header.val = {
-- "",
-- "",
-- "⠀⠀⠉⣿⣿⡉⠀⠀⠙⣿⣿⠁⠀⠀⠀⠀⠀⣤⣴⣿⣿⣿⣿⣶⣤⠀⠀⠀⠀⢨⣿⣿⣿⣿⣽⣿⣿⣿⣿⡇⠀⠀⠙⣿⣿⣿⠁⠀⠀⠈⣿⣯⣽⠉⠀⠀⠀⢹⣿⣿⠋⠀⠀⠀⠀⠙⣿⣿⣿⣯⣽⣿⣿⣿⣿⣿⣿⠋⠁⠀",
-- "⠀⠀⠀⣿⣿⣿⣦⡀⠀⣿⣿⠀⠀⠀⠀⢀⣮⣿⠟⠁⣿⡇⠉⢻⣿⣧⠀⠀⠀⠘⠉⠉⠉⣿⣿⡏⠉⠉⠉⠃⠀⠀⠀⠘⢿⣿⣧⠀⠀⢾⣿⡟⠁⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⡏⠉⢹⣿⣿⠉⠉⣿⣿⠀⠀⠀",
-- "⠀⠀⠀⣿⣿⢿⣿⣿⣦⣿⣿⠀⠀⠀⠀⢸⣿⣿⣶⣶⣿⣷⣶⣶⣿⣿⠄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣦⣼⣿⡿⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢸⣿⣿⠀⠀⣿⣿⠀⠀⠀",
-- "⠀⠀⠀⣿⣿⠀⠙⢿⣿⣿⣿⠀⠀⠀⠀⠈⢿⣿⣤⠀⣿⡇⢀⣴⣿⡟⠀⠀⠀⠀⠀⠀⠀⣿⣿⣟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢸⣿⣿⠀⠀⣿⣿⠀⠀⠀",
-- "⠀⠀⣀⣿⣿⡀⠀⠀⣙⣿⣿⡀⠀⠀⠀⠀⠀⠛⢿⣿⣿⣿⣿⠿⠛⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡿⠀⠀⠀⠀⠀⠀⠀⠀⣸⣻⣿⣄⠀⠀⠀⠀⣠⣾⣿⣇⢀⣸⣿⣿⡀⣀⣿⣿⣄⠀⠀",
-- "",
-- "",
-- }

-- dashboard.section.header.val = {
--   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   "⠛⣿⣿⣿⣿⣿⣶⣦⣤⡀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⡟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠘⠛⣿⣿⣿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣷⣦⣤⡀⠀",
--   "⠀⣿⣿⣿⠉⠙⠛⠻⣿⣿⣦⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠈⣻⣿⡇⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⠟⠛⣿⣿⡏⠛⢿⣿⣧⡄",
--   "⠀⣿⣿⣿⠀⠀⠀⠀⢻⣿⣿⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⡿⢻⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣷⣾⣿⣟⠁⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣯⣤⣤⣿⣿⣧⣤⣤⣿⣿⣷",
--   "⠀⣿⣿⣿⠀⠀⠀⠀⣼⣿⣿⠁⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⠃⠀⠻⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡟⠛⢻⣿⣷⡄⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣟⠛⠛⣿⣿⡟⠛⠛⣿⣿⡿",
--   "⠀⣿⣿⣿⣀⣀⣤⣴⣿⣿⠟⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⢸⣿⣿⣇⣀⣼⣿⣿⡇⠀⠀⠀⠀⠀⣿⣿⣿⣤⣤⣤⣤⣼⠀⠀⠀⠀⠙⣿⣿⣦⣤⣿⣿⣇⣤⣾⣿⡟⠃",
--   "⣤⣿⣿⣿⣿⣿⡿⠿⠛⠁⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣧⡄⠀⠀⠀⠀⠰⣿⣿⡟⠉⠉⠉⠉⠉⠉⠻⣿⣿⡦⠄⠀⠀⠀⢀⣼⣿⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⡿⠟⠛⠁⠀",
--   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠃⠀⠀⠀⠀⠀⠀⠐⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠟⠃⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀N E O V I M⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
-- }

dashboard.section.header.val = {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠠⠤⠄⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠼⠀⠀⢸⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⠀⠐⠂⠀⣤⡴⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠱⢄⡀⠀⢀⡀⠀⠀⠀⣤⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠄⠀⠀⠀⡟⠁⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢀⠀⠀⠈⠁⢰⠀⠀⠀⠁⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠄⠀⠈⠢⠀⠀⠀⠄⠀⠀⠀⠠⠚⠁⡉⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡅⠀⠀⠀⠀⠀⢀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢎⠲⣄⣀⠀⠀⠀⠗⠶⠃⠀⠀⠀⠀⢃⣀⠀⠀⠀⠀⠀⠰⠁⣀⠀⠀⠀⢀⠖⠀⠐⠚⠃⠀⠀⣀⣠⠶⠁⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢴⡀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⢡⡀⠂⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠈⢻⣿⣶⣶⣦⣤⣤⣤⣀⣀⣤⣤⠤⠀⠐⠁⠀⠀⠀⡄⠀⣀⣀⣀⣀⣀⣀⣤⣤⣴⣶⣾⡿⠋⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⠸⡆⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠒⠃⠀⠢⠤⠀⠠⠤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⠈⢿⣿⣿⣿⣿⣿⣿⣿⠛⠡⠊⠀⠀⠀⠀⠀⠀⠈⠀⢬⡹⣿⣿⣿⣿⣿⣿⣿⣿⢋⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠂⠁⠀⠀⠋⠦⡀⠀⠀⠀⠀",
  "⠀⠀⢈⢹⣿⣿⡿⠿⠿⣿⣿⣷⣕⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⠀⣿⣿⣿⣿⣿⣿⣿⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⣙⠇⠸⣿⣿⣿⣿⣿⣿⠇⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢋⣴⣾⣿⠿⣿⣿⣶⣄⡡⣄⡀⠀",
  "⠀⠀⢈⢸⣿⣿⠀⠀⠀⠀⠙⢿⣿⣦⢰⠀⠀⠀⠀⠀⠰⡖⠀⢰⠤⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⡟⠉⢆⠁⠀⠀⠀⠀⠀⠀⠀⠀⠖⠁⠇⢀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⡔⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣱⣿⡟⠉⡔⠀⠪⡉⢿⣿⣷⡌⡆⠀",
  "⠀⠀⣨⣸⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⡇⢣⠀⠀⠀⠀⠀⠈⠓⣶⣤⢀⠀⠀⠀⠀⠂⣿⣿⣿⣿⢟⣤⠶⣬⡃⣄⠀⠀⠀⠀⠀⠐⢬⢲⣦⡤⠤⣤⣽⣻⣿⣿⣿⠀⠀⠀⠀⡀⢤⣤⡄⢈⠀⠀⠀⠀⠀⠀⠀⢠⢱⣿⣿⠀⠀⢧⠀⠀⠈⠄⣿⣿⣿⠘⡄",
  "⠀⠀⣾⢸⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⡇⠨⠀⠀⠀⠀⠀⠘⠀⣿⣿⢸⠀⠀⠀⠀⠀⣿⣿⣿⣱⣿⠧⠤⠼⣿⣌⡀⠀⠀⠀⠀⠀⢘⢸⣿⣧⣤⣿⣿⣹⣿⣿⣿⠀⠀⠀⠀⠘⢸⣿⡇⢣⢀⠀⠀⠀⠀⠀⠀⡄⢸⣿⣿⠀⣧⠀⡀⠀⠀⢸⢸⣿⣿⠀⡇",
  "⠀⠀⠊⢸⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⡇⡀⠀⠀⠀⠀⠀⢰⠀⣿⣿⢸⡀⠀⠀⠀⡇⣿⣿⠏⣿⣿⠰⣶⡆⣿⣿⢹⠀⠀⠀⠀⠀⣸⢸⣿⡇⠰⢹⣿⡇⣹⣿⣿⠀⠀⠀⢀⡆⢸⣿⡇⠀⠛⡂⠀⠀⠀⠀⠀⢇⢸⣿⣿⠀⠋⠀⠁⠀⠀⡨⢸⣿⣿⠀⠃",
  "⠀⢀⠂⢸⣿⣿⠀⠀⠀⠀⢠⣼⣿⡟⠑⠀⠀⠀⠀⠀⠀⠃⠐⠛⠛⠂⠱⠀⠀⢠⠇⣿⣇⣐⣛⣛⣂⣹⡇⣿⣿⠸⠀⠀⠀⠀⠘⠁⠚⠛⢛⢛⣛⣻⣵⣿⣿⣿⠀⠀⠀⠈⠀⠛⠛⠛⠛⠛⠇⠜⠀⠀⠀⠀⠘⠚⢿⣿⣧⡀⠀⣄⣠⠤⠁⣾⣿⡟⠜⠀",
  "⢀⠌⣠⣼⣿⣿⣷⣶⣶⣾⣿⡿⠛⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⣿⣿⣿⣿⣿⣿⣷⣰⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠤⠛⣿⣿⣦⣤⣤⣤⣿⡿⠫⠀⠀⠀",
  "⠘⣠⠟⡋⠉⠉⠉⠉⠉⠭⠥⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠁⣿⣿⣿⣿⣿⡿⣣⠟⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠈⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠪⠍⠉⠛⠛⠉⠝⠀⠁⠀⠀⠀",
  "⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠖⣤⡔⠃⠀⣿⣿⣿⣿⣯⣾⣶⠁⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢰⣿⣿⣿⣿⣿⣿⡆⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⡛⢤⠀⠀⠀⠀⠀⢀⣫⣴⣿⣿⣿⣿⣿⣿⣿⣿⣤⣉⡉⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠂⠠⠤⠤⠀⠐⠒⠀⠀⠀⠀⠀⠰⠖⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠤⠤⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀N E O V I M⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

-- dashboard.section.header.val = {
--   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀",
--   "⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀",
--   "⠀⠀⢸⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣦⠀⠀⠀⠀",
--   "⠀⠀⠸⣿⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⢻⣿⣿⡆⠀⠀⠀",
--   "⠀⠀⠀⢻⡎⠙⠛⣦⡄⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⡞⠃⠸⣿⡞⣷⡄⠀⠀",
--   "⠀⠀⢔⣋⣁⣀⣙⣿⣍⡙⠻⢟⠶⣄⡀⠀⠀⠀⠀⠀⠀⠀⢀⣰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠉⣀⣀⣀⠉⠻⣿⢿⡀⠀",
--   "⠀⠀⢣⡘⣿⣿⠿⠿⠿⢿⣿⣷⣔⠈⢧⠀⠀⠀⠀⠀⠀⣼⢻⣿⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⣣⣾⡿⠛⠛⠻⣿⣿⣤⡘⣧⠀",
--   "⠀⠀⣸⡇⣿⣿⠀⡏⠹⣧⠉⢿⣿⣧⢸⡄⠀⠀⠀⠀⡩⡁⠈⠿⠿⠷⠀⠀⠀⠀⠀⠀⠀⢰⣿⡏⠀⢹⣷⣀⡄⠀⠀⠀⠀⠠⠾⠋⠸⠿⠿⢿⣿⡄⠀⠀⠀⠀⠀⠀⢀⡰⠶⠉⣞⡀⠀⠀⠀⠀⠀⠀⠀⣈⣾⣿⠉⠀⣶⠲⢶⣌⠻⣿⣷⡜⣧",
--   "⠀⣸⣿⡇⣿⣿⠀⡇⠀⢿⢠⠀⣿⣿⡇⡇⠀⠀⠀⠀⠈⡌⢻⣿⠋⢠⠃⠀⠀⠀⠀⠀⠀⡿⢛⡴⠛⢦⡛⠛⡇⠀⠀⠀⠀⢸⣎⢻⣿⠛⡻⣷⣦⠛⡄⠀⠀⠀⠀⠀⢸⣿⣿⡟⢃⡇⠀⠀⠀⠀⠀⠀⢠⣸⣿⡏⠀⣄⣿⡇⠀⠙⡆⢻⣿⣷⣿",
--   "⠀⢹⣿⡇⣿⣿⠀⡇⠀⢸⡸⠀⣿⣿⡇⣷⠀⠀⠀⠀⣾⡇⢸⣿⠀⣿⠀⠀⠀⠀⠀⠀⢰⢷⣿⠷⠶⠾⣿⣆⢷⡄⠀⠀⠀⠀⣸⢸⣿⠶⠷⣿⣇⢼⠁⠀⠀⠀⠀⠀⢸⣿⣿⡇⠸⣇⡀⠀⠀⠀⠀⠀⣽⣿⣿⡇⢀⣿⣿⡇⠀⠀⣿⢸⣿⣿⢸",
--   "⠀⠀⠟⠀⣿⣿⠀⡇⠀⣸⠇⣠⣿⣿⢇⠏⠀⠀⠀⠀⣼⠇⣸⣿⡀⢿⡀⠀⠀⠀⠀⠀⡜⣸⣿⠘⣿⡇⣿⣿⠀⡃⠀⠀⠀⢀⡿⢸⣿⡀⢇⣸⣿⢃⠇⠀⠀⠀⠀⠀⣼⢿⣿⣇⣀⣙⣫⢈⠀⠀⠀⠀⣿⢻⣿⣷⠀⠿⢸⡇⠀⢀⡿⣸⣿⡟⣿",
--   "⠀⢰⡇⢀⣿⣿⠀⠓⠚⢉⣰⣿⣿⡏⡸⠀⠀⠀⠀⠀⠹⢈⣉⣉⣉⡠⠇⠀⠀⠀⠀⠠⠌⠉⠉⠁⡼⡇⣿⡿⡰⠃⠀⠀⠀⠀⠤⠬⠍⠉⠩⠭⠵⠉⠀⠀⠀⠀⠀⠀⠣⢌⢉⣉⣉⣉⣋⠎⠀⠀⠀⠀⠈⣞⢿⣿⣦⡀⢸⣧⣴⠿⣁⣿⡿⢱⠏",
--   "⠀⡾⣠⣾⣿⣿⣿⣿⣿⣿⠿⢟⡣⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣻⠿⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠫⣟⠿⣿⣦⣤⣤⣾⠿⣫⡼⠃⠀",
--   "⢰⠡⢫⠍⠓⠒⠒⠒⠒⠒⠂⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⡕⡋⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠒⠫⠭⠭⠒⠚⠁⠀⠀⠀",
--   "⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀N E O V I M⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
-- }

-- dashboard.section.header.val = {
--     "⠀⠀⣀⣄⡀⠀⠀⠀⠀⠀⠀⠀⣤⣄⣤⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣠⣀⡀⠀⠀⠀⠀⠀⣤⡤⣤⢤⡤⣤⢤⡤⣤⢤⣄⡀⠀⠀⠀⣠⣤⢤⣄⡀⠀⠀⠀⠀⠀⣤⡤⣤⠀⣠⣤⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡀⠀⠀⠀⠀⠀⠀⢀⣤⣄⠀⠀",
--     "⠀⢸⢸⢨⠪⣣⡀⠀⠀⠀⠀⢸⢐⠬⡂⡇⠀⠀⡠⡒⡝⢔⢜⢔⡢⡪⡢⡢⡫⡲⢄⠀⠰⢰⡱⡸⡰⡱⡸⡰⡱⡸⡸⣸⡇⠀⠀⠀⠱⣎⢎⢢⠵⡄⠀⠀⠀⢸⠰⡸⡐⡇⡇⡆⡇⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⢞⢔⢲⣸⠄⠀⠀⠀⢀⡜⡕⡱⡨⡇⠀",
--     "⠀⢸⠪⡊⡎⡲⣘⢆⡀⠀⠀⢸⢘⢌⠇⡃⢠⡛⡜⡜⣜⠥⠗⠛⠛⠛⠲⢵⣱⢸⢑⢻⡈⠛⠛⠛⢻⠰⡱⡸⡟⠛⠛⠋⠃⠀⠀⠀⠀⠈⢯⡪⡪⡚⣆⡀⠀⢸⢘⢜⢌⡇⡇⢇⢣⢿⠀⠀⠀⠀⠀⠀⠀⡤⢇⠇⡇⡕⣺⠅⠀⠀⡠⡣⡣⢣⠣⡃⡇⠀",
--     "⠀⢸⠡⡑⢼⡔⠢⡑⠱⡄⠀⢸⠀⡣⠁⡇⡏⠌⡢⣱⠉⠀⠀⠀⠀⠀⠀⠀⠙⣌⠌⡢⢻⠀⠀⠀⢸⢈⠢⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢓⡕⠌⡊⠵⠀⢸⠠⢑⠐⡇⡇⡑⠅⣿⠀⠀⠀⠀⠀⢀⠞⠌⡢⣥⠑⢌⢺⠅⢀⡜⠡⡑⢬⡆⠣⡁⡇⠀",
--     "⠀⢸⠀⠠⢸⡊⢳⡀⠁⠈⠣⢸⠀⠀⠁⡆⡇⠀⠂⣯⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⢸⠀⠀⠀⢸⠀⠈⢐⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢣⡀⠁⠙⣸⠀⠀⠁⡇⡇⠀⠈⢼⠀⠀⠀⠀⡰⠁⠀⢁⠶⣹⠈⠀⢸⠵⠊⠀⢁⡰⢻⡂⠁⠀⡇⠀",
--     "⠀⢸⠀⡀⣸⡂⠀⠘⢦⡀⠄⡙⢀⠠⠀⡃⢧⢀⢀⠘⣄⠀⠀⠀⠀⠀⠀⠀⡠⢃⠀⠄⡞⠀⠀⠀⢸⠀⡀⣐⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠲⣄⢀⢈⢀⠠⠀⡇⡇⠀⠄⡽⠀⠀⢀⠞⡀⠠⣠⠛⠀⢺⢀⢀⢘⢁⠠⢠⠜⠀⢸⡂⡠⠀⡇⠀",
--     "⠀⢸⢰⢨⢺⠄⠀⠀⠀⠓⣕⢔⢅⢪⠂⡇⠈⡲⡢⡱⡨⢔⢒⢠⠤⡠⡒⡪⡑⡔⢕⠗⠁⠀⠀⠀⢸⢐⢌⢦⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢦⢱⡐⡅⡇⡇⡇⡅⡣⣻⠀⡤⡫⢢⠪⡴⠃⠀⠀⢽⡰⢢⢒⢔⡱⡃⠁⠀⢸⢇⡢⠅⡇⠀",
--     "⠀⢸⡸⢜⢺⠅⠀⠀⠀⠀⠈⠾⣪⢪⢃⠇⠀⠀⠉⠾⢼⣸⣪⢪⠪⡲⣱⣱⠭⠞⠉⠀⠀⠀⠀⠀⢸⡸⠸⢜⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⣱⠱⣑⠇⣇⠇⡏⣾⠞⡜⢜⢕⠯⠀⠀⠀⠀⠹⣸⢱⣑⡝⠁⠀⠀⠀⢸⡧⠳⡑⡇⠀",
--     "⠀⠀⠃⠃⠃⠁⠀⠀⠀⠀⠀⠀⠁⠋⠃⠀⠀⠀⠀⠀⠀⠀⠁⠑⠑⠑⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠋⠑⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠈⠀⠘⠘⠘⠈⠊⠊⠃⠃⠀⠀⠀⠀⠀⠀⠈⠊⠂⠀⠀⠀⠀⠀⠀⠑⠙⠘⠀⠀",
-- }

-- dashboard.section.header.val = {
--     "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⣿⢻⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⢄⣤⣤⠤⣤⣄⡀⡀⣤⣶⡶⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⠆⢴⣦⣤⡀⠀⠀⣀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣄⢠⢀⢤⣤⣤⣤⠄⠀⠀⠤⣠⣠⣠⣀⣤⠙⠿⡿⠁⠀⠀⠀⠀⠀⡤⣤⣤⣀⠀⠀⠀⠀⠀⣠⢤⣤⣤⣀⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⠀⠈⣿⣿⣿⣿⣏⠖⠉⠋⠙⢿⣿⣿⣶⣄⠀⠀⣠⣴⣶⣿⡿⠿⠿⣿⣷⣿⣿⣷⣄⣟⣿⣿⣯⣿⣿⣿⣿⣻⣟⣿⣿⡵⠿⢿⣿⣿⣿⣿⠉⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⡶⣲⣦⣷⣯⣿⣿⣾⣿⣿⣦⣀⣴⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀",
--     "⠀⠀⠀⠀⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠉⢻⣿⣿⣷⣴⣿⣿⣿⡏⠀⠀⠀⠈⠙⣿⣿⣿⣿⣿⠋⠉⣿⣿⣿⣿⡿⠉⠉⠉⠁⠀⠀⠈⢹⣿⣿⣿⠀⠀⠀⠀⣾⣿⣿⡟⣿⣿⣿⣿⣿⣾⣿⣿⡟⠉⠀⠉⠉⠻⣿⣿⣿⣿⠋⠉⠀⠀⠉⠙⢿⣿⣿⣷⡀⠀",
--     "⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣦⡀⠀⣤⣿⣿⡟⠁⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣧⠀",
--     "⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⡿⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣧⣼⣿⡿⠋⠀⠀⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⡟⠀",
--     "⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣰⣿⣿⣿⠟⢿⣿⣿⣿⣇⣀⠀⠀⠀⣀⣼⣿⡿⠟⠁⠀⠀⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⠁⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⣸⣿⣿⡿⠀⠀",
--     "⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀⢀⣼⣿⣿⠟⠁⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⠀⠀⠀⠀⣰⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡿⠁⠀⠀⠀⠀⣿⣿⣿⣿⡏⠻⣿⣿⡀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⠀",
--     "⠀⠀⠀⠀⠀⠋⠉⠁⠀⠀⠀⣠⣾⣿⠟⠁⠀⠀⠀⠀⠀⠈⠛⠻⠛⠛⠛⠉⠀⠀⠀⠀⠀⠀⠠⠘⠛⠛⠟⠟⠻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠁⠀⠀⠀⠀⠀⠈⠻⢿⣿⡇⠀⠘⢿⣿⣄⠀⠀⠀⠀⠹⠟⠛⠁⠀⠀⠀⢀⡾⣿⡟⠀⠀⠀⠀⠀",
--     "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⣩⠎⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠉⠻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢉⠞⠉⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
-- }

-- dashboard.section.header.val = {
--     "⠀⠀⠀⠀⠀⢀⣀⣀⡀⠀⠀⢀⡀⠀⠀⢀⡀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⣀⣀⡠⢀⠀⠤⢄⠤⠄⡀⠀⠀⡠⠤⡀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⠀⡠⣪⣶⣾⣷⣮⠢⠀⡇⡎⠀⠀⡀⡎⣢⣵⣷⣕⢄⢀⢐⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⡔⡵⡛⣿⣿⣿⣦⢂⢺⠟⣼⡀⠀⢸⢊⣾⣿⣮⡢⡀⠀⡠⣪⣶⣔⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⠘⣴⠫⢹⣿⣿⣿⣧⢃⡄⡇⡀⢐⣵⡟⢿⣿⣿⣿⣷⣥⢏⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢳⡎⠀⠀⢠⢸⠈⠈⡸⣿⣿⣿⣧⠆⣠⡿⡇⢀⠰⣿⣿⣿⣿⣿⢎⢎⢾⣿⣿⡿⡪⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⠀⣿⢠⠡⡻⣿⣿⣿⣷⠞⣨⣾⣿⠁⡇⠡⡝⣿⣿⣿⡿⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣡⣿⣿⠀⠀⠀⢜⢮⣒⡨⠬⠿⢏⣵⣾⣿⡇⡇⢸⢸⠀⡹⣿⠟⠕⠁⠀⠡⣛⠩⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⠘⠌⠣⣃⡼⠦⣉⢩⢄⣼⣿⣿⣿⡇⡇⠀⡇⣿⣿⣿⡇⡇⠀⠀⠀⠀⠀⠀⡠⠤⠄⠀⠀⡀⢀⠸⢾⣿⣿⣿⣀⣀⡀⠀⡑⠬⣙⣛⣁⣸⣿⣿⣿⡇⡇⢸⢸⠀⠀⢸⡈⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀",
--     "⠀⠀⠀⠀⠈⠒⣉⠩⣗⣀⣸⣿⣿⣿⣿⡇⣯⣬⣵⣿⣿⣿⡇⠇⠀⠀⢀⠠⣐⣨⣾⣿⣿⣿⡿⣸⢣⣿⣿⣿⣿⣿⣿⡟⢤⢪⣾⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢸⡬⠶⠤⢾⡇⠀⠀⡠⣠⣶⣬⣂⢔⠀⠠⣱⣮⡒⡀⢔⣼⣦⡠⣀⢌⣼⣮⡢⢒⢔⠀⠀",
--     "⠀⠀⠀⠀⢀⢪⣶⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣉⣿⣿⣿⣿⡇⠀⠀⠗⣶⣿⣿⣯⡻⣿⣿⣿⡇⠡⠚⠛⣿⣿⣿⢫⠭⠝⣆⣿⡿⠟⣩⣥⣤⣽⣿⣿⣿⡇⠀⢸⣟⣀⣀⣸⠁⠀⡮⢞⢿⣿⣿⡏⢊⢌⡵⣿⣿⣿⣠⠾⣿⣿⣷⣡⢺⣿⣿⣷⡟⠌⠀⠀",
--     "⠀⠀⠀⠀⡄⣿⢟⢫⢍⣋⣽⣿⣿⣿⣿⡇⣗⠤⡚⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⣿⢸⢸⣿⣿⡇⠀⠀⠀⣿⣿⣿⢸⠀⠀⠏⢟⢼⢸⣿⠿⣛⣿⣿⣿⣿⡇⠀⢸⣧⠈⠁⢹⠀⠀⠀⠀⢸⣿⣿⡇⠈⠚⢂⣿⣿⣿⡇⠂⣿⣿⣿⠱⠃⣿⣿⣿⢰⠀⠀⠀",
--     "⠀⠀⠀⠀⠇⣏⡞⢱⣿⣿⣿⣿⣿⣿⣿⣿⢸⠀⡇⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⣿⢸⢸⣿⣿⡇⠀⠀⠀⣿⣿⣿⢸⠀⠀⠈⠪⡢⢅⣉⣐⣒⢹⣿⣿⣿⡇⠀⢸⣿⠀⡄⣾⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⢸⣿⣿⣿⡇⠀⣿⣿⣿⠀⠀⣿⣿⣿⢸⠀⠀⠀",
--     "⠀⠀⠀⠀⢈⣊⣂⠸⢧⢀⢸⣿⣿⣿⡿⢻⢸⠀⡇⣿⣿⣿⡇⡤⣀⠀⣿⣿⣿⡏⢸⢸⣿⣿⡇⡆⠀⠀⣿⣿⣿⡸⠠⢀⠄⠀⠀⠉⠀⠀⢠⢸⣿⣿⣿⣷⡡⢸⣿⡰⣸⢏⠇⠀⠀⢀⢸⣿⣿⡇⠀⠀⢸⣿⣿⣿⡇⠀⣿⣿⣿⢀⠀⣿⣿⣿⢸⠀⠀⠀",
--     "⠀⠀⢔⣭⣶⣶⣶⣮⡣⢜⣾⣿⡿⢟⡴⣸⠸⠠⢣⣿⣿⣿⣿⡶⠣⠂⣿⣿⣿⣷⡙⢸⣿⣿⡧⠃⠀⢄⣿⣿⣿⣷⡶⠣⠁⠀⠀⠀⠀⠠⢁⢏⡻⣿⣿⣿⣿⣾⣯⡼⡣⠊⠀⠀⠀⠸⣼⣿⣿⣧⣢⠰⢌⣿⣿⣿⣇⢆⣿⣿⣿⡎⡀⣼⣿⣿⣦⣪⢵⠀",
--     "⠀⡈⣾⣿⣿⣿⣿⣿⣿⣏⠍⠒⠨⢔⣴⢏⡦⡱⢫⠝⣿⣿⡿⡑⠁⠐⠝⡻⣿⣿⣿⡾⢛⠍⠊⠁⠸⣚⠍⠻⣿⡟⡑⠁⠀⠀⠀⠀⠰⣱⡋⠂⠈⢈⡻⣿⣿⡿⡫⠊⠀⠀⠀⠀⢐⡵⣛⢿⣿⡿⡣⠢⢛⢿⣿⣿⢟⡹⣿⣿⣿⠇⡹⠿⣿⣿⣿⠣⠁⠀",
--     "⠀⡇⣿⠛⠕⠀⠀⠒⠩⣝⣛⣛⣛⠭⠒⠁⠋⠑⠁⠈⠪⣛⠜⠀⠀⠀⠀⠈⠐⠚⠓⠈⠀⠀⠀⠀⠀⠀⠀⠉⠊⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⠅⠊⠀⠀⠀⠀⠀⠀⠉⠉⠀⠑⠉⠊⠀⠀⠀⢃⠛⠔⠁⠈⠪⡙⡁⠑⠑⠉⠪⣛⡴⠁⠀⠀",
--     "⠀⢠⢻⡘⡀⠀⢀⡠⣐⣢⠽⢶⣶⣶⣶⠯⣔⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⠁⣙⢄⣐⡵⢞⠍⠂⠁⠀⠀⠀⠀⠈⡎⡇⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⠀⠀⠣⠫⡓⠮⣥⣒⣀⣀⣐⣒⣦⡬⢞⠑⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--     "⠀⠀⠀⠀⠀⠀⠀⠈⠐⠒⠛⠛⠛⠒⠂⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
-- }

-- dashboard.section.header.val = {
--     "⠀⠀⠀⣸⣿⣿⣿⣷⣄⡀⢠⣿⣿⣿⣿⠁⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣷⣦⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⠋⢠⣿⣿⣿⣿⠀⠀⣸⣿⣿⣿⣿⣦⡀⠀⣀⣴⣾⣿⣿⣿⡏",
--     "⠀⠀⠐⠛⠛⠛⠛⠛⠛⠛⠚⠛⠛⠛⠃⠀⠘⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠓⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠃⠘⠛⠛⠛⠓⠀⠀⠀⠀⠚⠛⠛⠛⠛⠛⠁⠀⠛⠛⠛⠛⠃⠀⠀⠛⠛⠛⠛⠛⠛⠛⠚⠛⠛⠛⠛⠛⠛⠀",
--     "⠀⠀⣿⣿⣿⣿⠟⢿⣿⣿⣿⣿⣿⣿⠀⢠⣿⣿⣿⡿⠀⠀⠀⢸⣿⣿⣿⡟⠀⠀⠀⠀⣾⣿⣿⣿⠁⠀⠀⠀⠀⠘⣿⣿⣿⣿⣇⢀⣼⣿⣿⣿⣿⡟⠁⠀⠀⢸⣿⣿⣿⣿⠀⠀⣾⣿⣿⣿⠟⢿⣿⣿⣿⢟⣿⣿⣿⣿⡇⠀",
--     "⠀⢸⣿⣿⣿⡏⠀⠈⢛⣿⣿⣿⣿⡇⠀⣾⣿⣿⣿⠇⠀⠀⢀⣿⣿⣿⣿⠀⠀⠀⠀⢰⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣾⣿⣿⣿⡿⠋⠀⠀⠀⠀⣿⣿⣿⣿⠃⠀⢰⣿⣿⣿⡿⠀⠈⠻⠛⠁⣸⣿⣿⣿⣿⠀⠀",
--     "⠀⣿⣿⣿⣿⠁⠀⠀⣸⣿⣿⣿⣿⠀⠰⣿⣿⣿⣿⣤⣤⣤⣼⣿⣿⣿⠃⠀⠀⠀⢀⣾⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⣸⣿⣿⣿⡟⠀⠀⣾⣿⣿⣿⠁⠀⠀⠀⠀⢠⣿⣿⣿⣿⠇⠀⠀",
--     "⣸⣿⣿⣿⡇⠀⠀⢠⣿⣿⣿⣿⠃⠀⠀⠛⠿⣿⣿⣿⣿⣿⡿⠿⠛⠁⠀⠀⠀⠀⣼⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⠁⠀⢸⣿⣿⣿⡏⠀⠀⠀⠀⠀⣼⣿⣿⣿⡏⠀⠀⠀",
-- }

-- dashboard.section.header.val = {
--   "⠀⡀⠀⠄⠈⠀⢀⠐⠀⠠⠐⠀⠀⠄⠀⠀⠀⠀⠀⢀⢀⠅⠒⠌⠊⠠⠁⠀⠀⠀⢐⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠐⠀⠀⠀⠀⠀⡐⠐⠈⠀⡂⠢⠈⠀⠀⠀⢀⠀⠄⡀⢂⠠⠀⡀⠠⠀⠂⠀⠂⠀⠄⠀",
--   "⠀⠠⠀⠂⢀⠈⠀⢀⠠⠀⠠⠈⠀⠀⠀⠁⠂⠂⠁⠁⠀⠈⠀⠐⠀⠁⠀⠀⡔⠍⢀⡀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠁⠀⠄⠐⠀⠌⠀⠀⠄⢂⠐⡀⠄⠂⠀⡀⠄⠐⠀⠐⠀⠐⢀",
--   "⠀⡁⠐⠈⡀⠠⠈⠀⢀⠠⠀⠂⠈⠠⠀⡀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠠⠀⢉⡰⣒⠕⠡⠠⠁⠀⠀⡀⢀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⢀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠄⠅⢂⠠⠐⠀⠄⠀⡀⠄⠐⠈⢀⠈⡀",
--   "⠀⠄⢈⠠⠀⠄⠂⠈⡀⠀⠄⠂⠁⠐⠀⠀⠀⠀⠀⡀⠀⠈⠄⢄⠢⠐⠊⠩⠘⢀⠐⠀⢀⠃⠀⢰⠁⠀⠀⠀⠀⠀⠀⡀⠢⡀⠐⠀⡂⠀⠈⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠠⠀⠂⠐⠀⠄⠀⠄⠐⠈⡀⠄⠠",
--   "⠀⠂⠠⠀⠂⠐⠈⡀⠄⠂⢀⠀⠀⠄⠀⠀⠀⠁⠡⠀⠀⠀⠀⠀⡀⠐⠈⠈⠐⠀⠀⡠⠁⠆⠀⠈⠈⠀⠸⢠⣄⣀⣆⡰⡨⠂⠀⠀⠀⠁⠠⠀⠈⠀⠀⠁⡀⠀⠀⠠⠈⠢⠐⡀⠠⢈⠀⡁⠐⠀⠂⠐⠈⡀⠄⠐⠀",
--   "⠀⡁⠂⢁⠈⡀⢁⠠⠐⠈⡀⠌⡠⠠⢐⠐⠐⢀⠠⠀⠄⠠⠀⠀⠀⠀⠀⠁⠀⠀⡂⠈⠀⠀⠀⠀⠀⠀⠀⢱⡿⣾⢷⣇⠅⠁⠀⠀⢀⠐⡄⡀⠀⠀⢀⠀⠐⠀⠀⠀⠈⠠⠑⢐⠀⢀⠂⠠⠈⡀⢁⠈⠠⠀⡐⠈⡀",
--   "⠠⠐⢈⠀⠄⠠⢀⠐⠀⡁⠠⠁⠀⠀⠀⠠⠊⠁⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠈⠀⠴⠈⢔⣠⡇⠀⣀⡃⢸⣟⢿⣟⡯⠀⠀⣤⠀⣌⠳⠘⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠐⡀⠀⠂⠐⡀⠄⠠⠈⡀⠂⡀⠂⠠",
--   "⠠⠁⠄⢂⠈⠄⡀⢂⠁⠄⠀⠀⡀⠔⠁⠁⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢴⢄⡀⠀⠈⠈⠉⠐⠤⠿⢠⣾⡮⡳⣿⡃⠤⠗⠁⠈⠀⠀⠀⡀⠔⡠⠈⠄⠀⠀⠀⠀⠀⠀⠀⠐⠀⠌⡀⠁⠄⠐⡀⠂⡀⠂⡐⠈⠄",
--   "⠠⠁⠌⡀⢂⠁⠄⠂⡀⠀⠀⠂⠀⠀⠀⡀⠀⡀⠠⠀⠀⠀⠀⠆⠐⠀⠀⢨⡪⡧⡳⡙⡐⠄⠀⠀⠀⠀⠀⠑⡷⢹⢽⠅⠀⠀⠀⡀⡄⢄⢰⣀⠁⡆⠅⠅⠀⠀⠀⠀⡂⠀⠀⠀⠈⠄⠠⠁⠄⡁⠄⢂⠠⢁⠐⡈⢐",
--   "⠨⠠⢁⢐⠠⠈⠄⠡⠀⠅⠨⠐⡀⠅⠂⠠⠀⡂⠁⠀⠀⠀⠀⡃⣟⡁⡀⠰⡽⡽⣮⠴⣾⢘⢁⠅⣶⢀⡢⠀⣘⣘⣈⠀⠀⢤⠲⢧⣢⡨⡸⢋⣹⠪⠨⠐⠀⠐⢀⡐⡄⠌⠄⠠⠁⠌⠐⡈⠠⠐⠐⡀⢂⠐⡀⢂⠐",
--   "⠨⢐⢀⠂⠄⠅⠌⠄⠡⠈⠄⠡⠠⢈⠀⠀⡂⠈⠀⠀⠀⡀⠄⠐⢹⢇⠢⠈⡾⣯⢿⡶⣭⢵⣢⣮⣭⣾⣡⣼⣦⣿⣧⡣⡣⡌⢉⣖⣶⡲⡼⣜⣞⠌⠌⠌⠀⠄⡜⡂⠀⠅⡂⠄⠡⠈⠄⢂⠨⠀⠅⡐⡀⢂⠂⢂⠡",
--   "⠨⢀⠂⠌⠄⡁⡂⠡⢁⠡⠁⠅⠨⠠⢀⠀⠀⠀⠀⠀⡈⡀⠀⠀⠘⢕⠋⠄⡯⣯⣿⣽⣿⣿⣿⣿⣿⣿⣽⡾⣿⣿⡷⣝⢞⣎⢮⡳⣗⠇⢏⣴⡴⡈⠌⡐⢠⠫⡑⠀⠀⢅⠂⢅⠡⠡⠨⢀⢂⢁⠢⠐⡀⡂⠌⠄⢂",
--   "⠨⢐⠨⠠⡁⡂⠄⠅⡂⠂⠅⠌⠌⡐⡐⡐⠄⠀⠀⠐⠌⠠⠀⠀⠀⠡⢣⡘⢜⣷⣻⣾⣯⣿⣿⣿⣿⣿⡳⡯⣿⣿⣿⢝⣕⢧⣳⡫⣗⢇⢿⢽⣺⣓⠐⡀⠪⠘⠀⠀⡨⢂⡑⣰⣬⡦⡁⡂⡐⡀⡂⠅⡐⡐⠨⢈⢐",
--   "⠨⡂⢌⢂⢂⠢⡡⢑⠨⡨⢨⠨⡨⡐⢄⢄⠠⡠⡠⠀⠁⠐⠀⠀⠀⠀⠐⢵⢸⣺⣽⡾⣯⣿⣿⣿⣿⣿⡞⣝⢞⣿⣿⠸⡸⡸⡮⣟⢮⠸⡽⡺⣳⠇⢀⠂⠈⠀⡄⡕⡕⠅⣮⣿⣳⣻⢀⢂⠢⡂⡢⢑⢐⠌⢌⢂⢂",
--   "⡑⢌⢂⡊⡢⡑⡌⢆⢣⢊⢢⢱⠰⡸⡰⡑⡕⡕⡕⠄⠀⠀⢀⠀⠀⠀⠀⠀⠀⢺⣺⣻⣯⣿⢿⣿⣯⣿⣿⣆⡑⠄⠉⠀⣰⢾⣻⡽⣇⢸⣹⣺⢮⢇⠐⡀⠀⠐⣕⢇⡇⣏⣿⢇⢗⢇⢕⠜⡌⡢⡊⡆⢕⠸⡐⡌⡢",
--   "⢜⢐⢑⢌⠪⡨⡊⡪⡂⡣⡑⡅⡣⢣⠱⡱⡱⡹⠀⠀⢠⠀⠀⠀⠄⠀⠀⠀⠀⢘⢞⣗⣟⣞⣽⣮⢝⢿⣿⣿⣷⣤⣤⡾⣽⡿⡽⣯⢷⢸⢼⣺⢽⢕⠠⠀⠀⠀⣳⢹⢰⣳⡽⣞⠗⡨⠢⡣⡑⡅⢕⢜⢘⠜⢌⠢⡑",
--   "⢔⠡⡂⠆⢕⠰⠨⡂⡊⡢⢑⠌⢌⠢⡑⡌⡪⢸⢀⠀⠀⠀⠀⠂⡀⠄⠀⠀⠀⡊⢪⢞⣞⢼⣻⣿⣯⢧⢋⣂⣂⣂⣂⣐⣐⣨⣩⣴⢿⡸⣽⣺⣯⢗⠅⡄⠂⠀⡇⠇⣸⣿⢽⢶⠰⡘⢌⠢⡊⢌⠢⠢⡡⡑⠅⠕⢌",
--   "⢔⠡⡨⠨⡂⢅⠕⡐⢅⠪⡐⢅⠅⡕⢌⠢⡊⢆⠣⠁⠀⠀⡀⠂⠀⠀⠀⠀⢐⠥⡈⠮⡺⣅⢗⡯⣻⣿⡵⡜⠿⠿⠿⠟⠯⣳⡯⣯⣗⠇⣯⣿⣯⡏⡇⠁⡂⢠⠣⣃⣿⡿⣝⡇⠨⠢⡑⢌⠢⡑⢌⠪⡐⠌⡌⠪⡐",
--   "⠢⡑⢌⠪⡨⠢⡑⢌⢢⠱⡨⢢⠱⡨⠢⡣⡑⡅⡃⢠⠂⠐⠀⠀⠀⠀⠀⠀⢰⠱⡡⠀⠙⢮⣣⢹⣻⣿⣿⣽⡂⣤⣤⣤⢜⣵⣟⣗⡇⠕⣜⣯⢿⣺⢸⠀⡊⢆⡃⢼⣾⣿⡣⠅⡪⡑⢜⠰⡑⡌⢆⠕⢌⠪⡨⡊⢔",
--   "⢕⠸⡐⢕⠸⡨⠪⡘⡔⡱⡘⢔⠕⠬⡱⡨⡢⢣⠡⠂⠀⠀⢀⠀⠀⠀⠀⠀⡎⡎⡪⠀⠀⠀⠑⢧⠳⢽⢿⣿⣿⣢⡛⣿⣻⣞⡾⡪⠂⠅⢲⣭⣿⣾⡱⡅⠪⡀⢪⣺⣿⡿⣝⡅⡪⡘⡌⢎⢢⢑⢅⠕⡅⡣⡒⢜⠰",
--   "⢕⢅⢣⠱⡑⡜⡸⡨⢢⠱⡘⡔⢕⠕⡕⢜⢌⠎⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⣇⣏⢇⠠⢀⢂⠄⠀⠙⠬⢻⣻⣿⣿⣾⡜⡻⣎⢋⠌⢨⣴⢐⢝⡿⣷⠯⠚⠈⠂⠘⠚⠛⠻⠣⠃⢪⠪⡸⡨⢢⠣⡑⢕⠸⡐⡅⡣⡱",
--   "⢕⠌⡆⡣⡱⡘⡔⢜⢌⢎⢪⢸⢘⢜⢜⠜⢔⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢕⣮⡇⢄⢧⣣⣗⣷⣤⣤⣄⡓⡿⣿⣿⣿⣮⠐⠠⣰⡿⣝⠀⡠⡀⢒⠎⢀⠀⠀⠨⡑⡍⡃⠄⡀⢰⢱⢱⢸⢨⠪⡊⡎⡪⡘⡌⢆⠕",
--   "⠁⢁⠈                                                                       ⣬⡈⠎",
--   "⢀⠂⠄   ██████╗ ██╗  ██╗███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ⢏⢇⠃",
--   "⠪⠘⠈  ██╔═══██╗██║  ██║████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ⠒⠔⠕",
--   "⠈⠀⠀  ██║   ██║███████║██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ⠀⠀⠀",
--   "⢀⠐⢀  ██║   ██║██╔══██║██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ⠆⣊⢊",
--   "⢐⡱⡰  ╚██████╔╝██║  ██║██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ⠔⠱⠈",
--   "⢕⢘⢐   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ⡀⠠⡤",
--   "⢂⠅⡢                                                                       ⢾⣆⢻",
--   "⠡⡑⡈⢕⠩⢱⢣⢹⢸⢘⢜⢌⠲⡱⡘⡎⢆⡣⣑⠪⠢⡑⡑⠌⡈⠄⠀⠀⢀⠠⢐⠢⠡⡱⡱⡹⢸⠐⠀⠀⠌⠄⠡⠀⠂⡐⠀⠄⢂⠨⠠⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠂⠀⠀⠄⠀⣅⢸⣺⣟⣷⠙⣾⣻⣽⠐",
--   "⠐⡐⠠⡂⠌⡂⡑⢄⠣⡘⢔⢅⠫⡜⢜⡪⡣⡓⡜⢌⠪⢀⠐⠀⠠⠀⡀⠂⠔⢌⠢⢡⢣⠡⡃⡃⡇⠀⠂⢄⠈⠌⠐⠈⠄⢂⠂⠨⠀⠂⠐⠀⠀⠀⠄⠀⡀⣀⠄⠜⠈⠀⠈⠀⠂⣀⢜⡾⣆⠹⡟⡞⠅⠒⠈⣀⣀",
-- }

-- Send config to alpha
alpha.setup(dashboard.opts)
