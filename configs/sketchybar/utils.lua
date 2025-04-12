local M = {}

function M.format_time()
  local hour = os.date("%H")
  local min = os.date("%M")
  return string.format("%02d:%02d", hour, min)
end

function M.format_date()
  local day = os.date("%a")  -- Abbreviated day name (Mon)
  local month = os.date("%b") -- Abbreviated month name (Oct)
  local date = os.date("%d")  -- Day of month (7)
  return string.format("%s, %s %s", day, month, date)
end

function M.padding()
  return {
    position = "right",
    width = 7,
  }
end


return M 