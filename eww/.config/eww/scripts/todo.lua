#!/bin/lua
M = {}

function M.read()
  local lines = {}
  for line in io.lines(os.getenv("XDG_CONFIG_HOME") .. "/eww/assets/todo.txt") do
    lines[#lines + 1] = line
  end
  local output = '(scroll :class "todo__scroll" :height "160" (box :class "cal__todo-list" :orientation "v" :space-evenly "false" :spacing "4" '
  for k, v in pairs(lines) do
    local item_start = '(centerbox :class "cal__todo-line-container" :orientation "h" :space-evenly "false" '
    item_start = item_start .. [[(eventbox :onclick "$XDG_CONFIG_HOME/eww/scripts/todo.lua done ]] .. k .. [["]]
    local item_end = [[) (box :width "1") (button :class "cal__todo-delete" :halign "end" :onclick 'sed -i "]] .. k .. [[d" $XDG_CONFIG_HOME/eww/assets/todo.txt && eww update todo_file="$($XDG_CONFIG_HOME/eww/scripts/todo.lua read)"' ""))]]
    output = output
      .. item_start
      .. [[(label :class "cal__todo-line" :halign "start" :limit-width "24" :tooltip "]]
      .. v
      .. [[" :text "]]
      .. v
      .. [[")]]
      .. item_end
  end
  output = output .. "))"
  io.close()
  print(output)
end

function M.done(line_number)
  local file = io.open(os.getenv("XDG_CONFIG_HOME") .. "/eww/assets/todo.txt", "r")
  local lines = {}
  for line in file:lines() do
    table.insert(lines, line)
  end
  file:close()

  if string.find(lines[tonumber(line_number)], "◼") then
    lines[tonumber(line_number)] = lines[tonumber(line_number)]:gsub("◼", "☑")
  else
    lines[tonumber(line_number)] = lines[tonumber(line_number)]:gsub("☑", "◼")
  end

  local temp_file = io.open(os.getenv("XDG_CONFIG_HOME") .. "/eww/assets/todo.tmp.txt", "w")
  for _, line in ipairs(lines) do
    temp_file:write(line .. "\n")
  end
  temp_file:close()

  os.remove(os.getenv("XDG_CONFIG_HOME") .. "/eww/assets/todo.txt")
  os.rename(
    os.getenv("XDG_CONFIG_HOME") .. "/eww/assets/todo.tmp.txt",
    os.getenv("XDG_CONFIG_HOME") .. "/eww/assets/todo.txt"
  )
  os.execute([[eww update todo_file="$($XDG_CONFIG_HOME/eww/scripts/todo.lua read)"]])
end

M[arg[1]](arg[2])
