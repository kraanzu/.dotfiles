return {
	{
		"gbprod/nord.nvim",
		config = function()
			require("nord").setup({})
			vim.cmd.colorscheme("nord")
		end,
	},
}
