return {
	"nvim-lua/plenary.nvim",
	"mfussenegger/nvim-dap",
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		cmd = "Mason",
	},
}
