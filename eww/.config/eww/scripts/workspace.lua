#!/bin/lua
function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, "r"))
  local s = assert(f:read("*a"))
  f:close()
  if raw then
    return s
  end
  s = string.gsub(s, "^%s+", "")
  s = string.gsub(s, "%s+$", "")
  s = string.gsub(s, "[\n\r]+", " ")
  return s
end

local function split_string(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local workspaces = {}
local display_count = 2
local orientation = 'v'

if arg[1] ~= nil then
  display_count = arg[1] + 0 -- use + 0 convet to int
end
if arg[2] ~= nil then
  orientation = arg[2]
end

-- populate workspace array
for i = 0, (display_count * 4) do
  workspaces[i] = "bar__workspace__right--inactive"
end

-- set class of used workspaces
local used = os.capture("wmctrl -l", true)

for k, line in pairs(split_string(used, "\n")) do
  if k > 7 then
    break
  end

  local used_workspace = tonumber(string.sub(line, 13, 13))

  if used_workspace > 3 then
    ---@diagnostic disable-next-line: need-check-nil
    workspaces[used_workspace] = "bar__workspace__left--active"
  else
    ---@diagnostic disable-next-line: need-check-nil
    workspaces[used_workspace] = "bar__workspace__right--active"
  end
end

-- set class of current workspace
local current_workspace = tonumber(os.capture("xdotool get_desktop"))
if current_workspace > 3 then
  ---@diagnostic disable-next-line: need-check-nil
  workspaces[current_workspace] = "bar__workspace__left--current"
else
  ---@diagnostic disable-next-line: need-check-nil
  workspaces[current_workspace] = "bar__workspace__right--current"
end

-- create array of buttons

local keybinds = {
  ',',
  '.',
  ';',
  '/', -- in case I get a fourth display
}

local buttons = {}
for i = 0, display_count - 1 do

  local button = {}
  for j = 0, 3 do
    local cap = "' '●')"

    button[j + 1] ="(button :timeout '0.4s' :onclick './scripts/change_focus.bash " .. i .. "' :class '"
    .. workspaces[j + (4 * i)]
    .. cap
  end
  buttons[i] = button
end

local spacing = 0
if orientation == "h" then
  spacing = 5
end

local boxes = {}
for i = 0, display_count - 1 do
  local box = "(box :class 'bar__workspace' :valign 'center' :orientation '" .. orientation .. "' :spacing " .. spacing .. " '" .. keybinds[i + 1] .. "'"

  for k, button in pairs(buttons[i]) do
    box = box .. button
  end

  box = box .. ")"
  boxes[i] = box
end

local output = "(box :class 'workspaces' :valign 'center' :orientation '" .. orientation .. "' :spacing 5 "
for i = 0, display_count - 1 do
  output = output .. boxes[i]
end
output = output .. ")"

print(output)
