local M = {}

function M.extra_config(config)
	config.unix_domains = {
		{
			name = "unix",
		},
	}
	config.default_gui_startup_args = { "connect", "unix" }
end

return M
