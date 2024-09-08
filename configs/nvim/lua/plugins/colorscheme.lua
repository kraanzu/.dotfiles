return {
	{
		"gbprod/nord.nvim",
		config = function()
			require("nord").setup({ transparent = true })
			vim.cmd.colorscheme("nord")
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				background = "hard",
				transparent_background_level = 0.5,
				italics = true,
				disable_italic_comments = false,
			})
		end,
	},
}
