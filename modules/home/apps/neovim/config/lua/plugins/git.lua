return {
	-- GIT STUFF
	{ "tpope/vim-fugitive", cmd = "G" },
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	},
	{
		"TimUntersberger/neogit",
		tag = "v0.0.1",
		cmd = "Neogit",
		config = function()
			require("neogit").setup()
		end,
	},
}
