local colors = require("colors")

local window_count = sbar.add("item", 'window_count', {
  icon = {
    string = " ",
    color = colors.bar.bg,
    padding_left = 5,
  },
  label = {
    string = "0",
    color = colors.bar.bg,
    padding_right = 5,
    font = {
      size = 15,
    }
  },
  background = {
    color = colors.green,
    corner_radius = 0
  },
})

function update_window_count(env)
  sbar.set(env.NAME, { label = { string = env.OPEN_WINDOWS } })
end

window_count:subscribe("aerospace_focus_change", update_window_count)