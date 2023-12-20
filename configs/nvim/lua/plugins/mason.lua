return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		cmd = "Mason",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
}
