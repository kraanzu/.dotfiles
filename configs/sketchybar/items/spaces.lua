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

-- Handle workspace change event
local function handle_workspace_change(env)
  local focused_workspace = env.FOCUSED_WORKSPACE
  -- Update the focused workspace item
  for _, workspace in ipairs(get_aerospace_workspaces()) do
    sbar.set("item_" .. workspace, {
      background = { color = workspace == focused_workspace and colors.red or colors.bg1 }
    })
  end
end

-- Static display of workspaces - no event handling
local workspace_list = get_aerospace_workspaces()
local spaces = {}

-- Add each workspace as a simple item (not a space)
for _, workspace_id in ipairs(workspace_list) do
  local space = sbar.add("item", {
    name = "space." .. workspace_id,
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
    }
  })

  local test_file = io.open(os.getenv("HOME") .. "/test", "w")
  if test_file then
    test_file:write(space.name .. '\n')
    test_file:close()
  end
  
  table.insert(spaces, space.name)
  space:subscribe("aerospace_workspace_change", handle_workspace_change)
end

-- Only add a bracket if we have spaces
if #spaces > 0 then
  sbar.add("bracket", spaces, {
    background = { color = colors.bg1, border_color = colors.bg2, corner_radius = 0 }
  })
end