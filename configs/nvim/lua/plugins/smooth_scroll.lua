return {
	{
		"karb94/neoscroll.nvim",
		event = "BufRead",
		config = function()
			require("neoscroll").setup()
		end,
	},
}
