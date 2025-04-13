local colors = require("colors")

-- Static display of workspaces - no event handling
local workspace_list = {}
local handle = io.popen("aerospace list-workspaces --all")
if handle then
  local result = handle:read("*a")
  handle:close()
  for workspace in result:gmatch("%S+") do
    table.insert(workspace_list, workspace)
  end
end

local spaces = {}

-- Add each workspace as a simple item (not a space)
for _, workspace_id in ipairs(workspace_list) do
  local space = sbar.add("item", "space." .. workspace_id, {
    icon = {
      string = workspace_id,
      padding_left = 5,
      padding_right = 0,
      color = colors.white,
    },
    padding_left = 0,
    padding_right = 0,
    background = {
      color = colors.bg1,
      corner_radius = 0,
    },
  })
  
  table.insert(spaces, space.name)
end

-- Only add a bracket if we have spaces
if #spaces > 0 then
  sbar.add("bracket", spaces, {
    background = { color = colors.bg1, border_color = colors.bg2, corner_radius = 0 }
  })
end