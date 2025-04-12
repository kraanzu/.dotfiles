local colors = require("colors")
local utils = require("utils")

local date = sbar.add("item", {
  position = "right",
  icon = {
    string = "󰃶 ",
  },
  label = {
    string = utils.format_date(),
  },
  update_freq = 60,
})

local function date_update()
  date:set({
    label = { string = utils.format_date() }
  })
end

date:subscribe({"routine"}, date_update)

sbar.add("bracket", {date.name}, {
  background = {
    color = colors.bg1,
    border_color = colors.bg2,
    corner_radius = 0
  }
})