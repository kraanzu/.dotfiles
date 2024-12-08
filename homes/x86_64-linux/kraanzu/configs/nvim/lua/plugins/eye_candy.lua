return {
	-- EYE CANDY
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"stevearc/dressing.nvim",
	},
}
