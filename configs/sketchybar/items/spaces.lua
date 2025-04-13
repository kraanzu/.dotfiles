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

-- Get the focused workspace from Aerospace
function get_focused_workspace()
  local handle = io.popen("aerospace list-workspaces --focused")
  local focused_workspace = handle:read("*a"):gsub("%s+", "")
  handle:close()
  return focused_workspace
end

-- Check if a workspace has any windows
local function is_workspace_active(workspace)
  local handle = io.popen("aerospace list-windows --workspace " .. workspace)
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result ~= ""
  end
  return false
end


-- Handle workspace change event
local function update_workspaces_widget()
  local focused_workspace = get_focused_workspace()
  local all_workspaces = get_aerospace_workspaces()

  for _, workspace in ipairs(all_workspaces) do
    local is_focused = workspace == focused_workspace
    local is_active = is_workspace_active(workspace)

    if is_focused then
      sbar.set("space." .. workspace, {
        background = { color = colors.cyan },
        icon = { color = colors.bar.bg }
      })
    elseif is_active then
      sbar.set("space." .. workspace, {
        background = { color = colors.bg1 },
        icon = { color = colors.white }
      })
    else
      sbar.set("space." .. workspace, {
        background = { color = colors.bg1 },
        icon = { color = colors.grey }
      })
    end
  end
end

-- Static display of workspaces - no event handling
local workspace_list = get_aerospace_workspaces()
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
  space:subscribe("aerospace_workspace_change", update_workspaces_widget)
end

-- Only add a bracket if we have spaces
if #spaces > 0 then
  sbar.add("bracket", spaces, {
    background = { color = colors.bg1, border_color = colors.bg2, corner_radius = 0 }
  })
end