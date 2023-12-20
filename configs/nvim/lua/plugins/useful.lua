return {
	-- USEFUL STUFF
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("plugin.copilot")
		end,
	},
	{ "preservim/tagbar", cmd = "TagbarToggle" },
	{ "nvim-telescope/telescope.nvim", cmd = "Telescope", tag = "0.1.2" },
	{ "sbdchd/neoformat", event = "BufRead" },
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.oil")
		end,
	},
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		config = function()
			require("neogit").setup()
		end,
	},
}
