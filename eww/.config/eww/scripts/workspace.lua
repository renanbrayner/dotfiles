#!/bin/lua
-- local params = { ... }
-- TODO: add params to allow for easy config
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
for i = 0, 3 do
  workspaces[i] = "bar__workspace__right--inactive"
end

for i = 4, 7 do
  workspaces[i] = "bar__workspace__left--inactive"
end

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

local current_workspace = tonumber(os.capture("xdotool get_desktop"))
if current_workspace > 3 then
  ---@diagnostic disable-next-line: need-check-nil
  workspaces[current_workspace] = "bar__workspace__left--current"
else
  ---@diagnostic disable-next-line: need-check-nil
  workspaces[current_workspace] = "bar__workspace__right--current"
end

local buttons_left = {}
for i = 1, 4 do
  local cap = "' '●')"

  buttons_left[i] = "(button :timeout '0.4s' :onclick './scripts/change_focus.bash 384 680 33 " .. i + 3 .. "' :class '"
      .. workspaces[i + 3]
      .. cap
end

local buttons_right = {}
for i = 1, 4 do
  local cap = "' '●')"

  buttons_right[i] ="(button :timeout '0.4s' :onclick './scripts/change_focus.bash 1728 680 -33 " .. i - 1 .. "' :class '"
      .. workspaces[i - 1]
      .. cap
end

local output_left = "(box :class 'bar__workspace' :valign 'center' :orientation 'v' :spacing 0 ','"
for k, button in pairs(buttons_left) do
  output_left = output_left .. button
end
output_left = output_left .. ")"

local output_right = "(box :class 'bar__workspace' :valign 'center' :orientation 'v' :spacing 0 '.'"
for k, button in pairs(buttons_right) do
  output_right = output_right .. button
end
output_right = output_right .. ")"

print("(box :class 'workspaces' :valign 'center' :orientation 'v' :spacing 5 " .. output_right .. output_left .. ")")
