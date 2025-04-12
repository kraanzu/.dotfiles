local colors = require("colors")
local utils = require("utils")

local time = sbar.add("item", {
  position = "right",
  icon = {
    string = "󰥔 ",
  },
  label = {
    string = utils.format_time(),
  },
  update_freq = 1,
})

local function time_update()
  time:set({
    label = { string = utils.format_time() }
  })
end

time:subscribe({"routine"}, time_update)

sbar.add("bracket", {time.name}, {
  background = {
    color = colors.bg1,
    border_color = colors.bg2,
    corner_radius = 0
  }
}) 