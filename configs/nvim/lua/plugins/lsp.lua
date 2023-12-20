return {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("plugin.lsp")
		end,
		event = "BufRead",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		event = "BufRead",
		config = function()
			require("plugin.cmp")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
	},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/vim-vsnip",
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({})
		end,
		event = "BufWrite",
	},
}
