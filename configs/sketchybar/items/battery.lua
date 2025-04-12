local icons = require("icons")
local colors = require("colors")

local battery = sbar.add("item", {
  position = "right",
  icon = {
    string = icons.battery._100,
  },
  label = {
    string = "100%",
  },
  update_freq = 120,
})

local function battery_update()
  sbar.exec("pmset -g batt", function(batt_info)
    local icon = icons.battery._100
    local percentage = "100%"

    if (string.find(batt_info, 'AC Power')) then
      icon = icons.battery.charging
      local found, _, charge = batt_info:find("(%d+)%%")
      if found then
        percentage = charge .. "%"
      end
    else
      local found, _, charge = batt_info:find("(%d+)%%")
      if found then
        charge = tonumber(charge)
        percentage = charge .. "%"

        if charge > 80 then
          icon = icons.battery._100
        elseif charge > 60 then
          icon = icons.battery._75
        elseif charge > 40 then
          icon = icons.battery._50
        elseif charge > 20 then
          icon = icons.battery._25
        else
          icon = icons.battery._0
        end
      end
    end

    battery:set({
      icon = { string = icon },
      label = { string = percentage }
    })
  end)
end

battery:subscribe({"routine", "power_source_change", "system_woke"}, battery_update)

sbar.add("bracket", {battery.name}, {
  background = {
    color = colors.bg1,
    border_color = colors.bg2,
    corner_radius = 0
  }
})