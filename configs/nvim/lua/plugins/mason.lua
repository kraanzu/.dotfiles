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
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
                automatic_installation = true,
				ensure_installed = {
                  "pyright",
                  "lua_ls",
                  "marksman",
				},
			})
		end,
	},
}
