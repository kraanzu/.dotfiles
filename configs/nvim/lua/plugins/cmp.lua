return {
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			require("config.cmp")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({})
		end,
		event = "BufWrite",
	},
	{ "hrsh7th/nvim-cmp", event = "BufRead" },
	{ "hrsh7th/cmp-buffer", event = "BufRead" },
	{ "hrsh7th/vim-vsnip", event = "BufRead" },
	{ "hrsh7th/cmp-cmdline" },
}
