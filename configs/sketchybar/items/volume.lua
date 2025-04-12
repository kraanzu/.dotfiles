local colors = require("colors")
local icons = require("icons")

local volume_item = sbar.add("item", {
  position = "right",
  icon = {
    string = icons.volume._100,
  },
  label = {
    string = "100%",
  },
})

volume_item:subscribe("volume_change", function(env)
  local volume = tonumber(env.INFO)
  local icon = icons.volume._0
  if volume > 0 then
    icon = icons.volume._100
  end

  volume_item:set({
    icon = { string = icon },
    label = { string = volume .. "%" }
  })
end)

-- Add volume item to bracket
sbar.add("bracket", {volume_item.name}, {
  background = {
    color = colors.bg1,
    border_color = colors.bg2,
    corner_radius = 0
  }
})