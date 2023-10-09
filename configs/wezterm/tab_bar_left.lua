local wezterm = require("wezterm")
local utils = require("utils")

M = {}

local icons = {
	vim = "",
	nvim = "",
}

function M.get_icon(cmd, cwd)
	if cmd:sub(1, 1) == "~" then
		if utils.is_in(cwd, "config") then
			return ""
		elseif utils.is_in(cwd, "Documents") then
			return "󰃀"
		else
			return ""
		end
	end

	return icons[cmd] or ""
end

function M.get_name(title, cmd)
	if cmd:sub(1, 1) == "~" then
		return title:match("[^/]+$")
	end

	return cmd
end

function M.tab_title(tab_info)
	local cwd = tab_info.active_pane.current_working_dir
	local title = tab_info.active_pane.title
	local cmd = title:match("%S+")
	local icon = M.get_icon(cmd, cwd)
	local name = M.get_name(title, cmd)
	return icon .. " " .. name
end

wezterm.on("format-tab-title", function(tab)
	local title = M.tab_title(tab)
	if tab.is_active then
		Res = {
			{ Background = { Color = "#81a1c1" } },
			{ Foreground = { Color = "#2e3440" } },
			{ Text = " " .. title .. " " },
		}
	else
		Res = {
			{ Background = { Color = "#4c566a" } },
			{ Foreground = { Color = "#d8dee9" } },
			{ Text = " " .. title .. " " },
		}
	end

	utils.appendTables(Res, utils.tab_separator)
	return Res
end)

-- =======================================

function M.setup(config)
	config.colors = {
		tab_bar = {
			background = "#2e3440",
		},
	}
end

return M
