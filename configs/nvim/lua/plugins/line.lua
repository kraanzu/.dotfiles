local function show_lsp()
	local msg = "No Active Lsp"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return client.name
		end
	end
	return msg
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diagnostics" },
					lualine_c = {},
					lualine_x = { "filetype" },
					lualine_y = {},
					lualine_z = { "location" },
				},
				tabline = {
					lualine_a = {
						{
							"buffers",
							show_filename_only = true, -- Shows shortened relative path when set to false.
							hide_filename_extension = false, -- Hide filename extension when set to true.
							show_modified_status = true, -- Shows indicator when the buffer is modified.
							buffers_color = {
								active = { bg = "#2e3440", fg = "#8fbcbb", gui = "bold" },
								inactive = { bg = "#2e3440", fg = "#4c566a", gui = "bold" },
							},
							mode = 0, -- 0: Shows buffer name
							symbols = {
								modified = " ●", -- Text to show when the buffer is modified
								alternate_file = "", -- Text to show to identify the alternate file
								directory = "", -- Text to show when the buffer is a directory
							},
						},
					},
					lualine_z = {
						-- Lsp server name .
						{
							show_lsp,
							icon = "",
							color = { fg = "#4c566a", bg = "#a3be8c", gui = "bold" },
						},
					},
				},
			})
		end,
	},
}
