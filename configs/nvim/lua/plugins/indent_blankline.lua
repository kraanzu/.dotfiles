return {
	{
		"lukas-reineke/indent-blankline.nvim",
		tag = "v2.20.8",
		event = "BufRead",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("eol:↴")
			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
			})
		end,
	},
}
