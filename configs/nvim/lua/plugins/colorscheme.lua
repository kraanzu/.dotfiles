return {
	{
		"gbprod/nord.nvim",
		config = function()
            require("nord").setup({transparent=true,})
			vim.cmd.colorscheme("nord")
		end,
	},
}
