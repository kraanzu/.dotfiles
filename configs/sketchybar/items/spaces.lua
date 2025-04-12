local colors = require("colors")

-- Get all workspaces from Aerospace
local function get_aerospace_workspaces()
  local workspaces = {}
  local handle = io.popen("aerospace list-workspaces --all")
  if handle then
    local result = handle:read("*a")
    handle:close()
    for workspace in result:gmatch("%S+") do
      table.insert(workspaces, workspace)
    end
  end
  return workspaces
end

-- Static display of workspaces - no event handling
local workspace_list = get_aerospace_workspaces()
local space_items = {}

-- Add each workspace as a simple item (not a space)
for _, workspace_id in ipairs(workspace_list) do
  local item = sbar.add("item", {
    icon = {
      string = workspace_id,
      padding_left = 10,
      padding_right = 10,
      color = colors.white,
    },
    padding_left = 5,
    padding_right = 5,
    background = {
      color = colors.bg1
    }
  })
  
  table.insert(space_items, item.name)
end

-- Only add a bracket if we have spaces
if #space_items > 0 then
  sbar.add("bracket", space_items, {
    background = { color = colors.bg1, border_color = colors.bg2 }
  })
end