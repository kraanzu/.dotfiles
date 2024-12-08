return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufRead",
	config = function()
		require("nvim-treesitter.configs").setup({ highlight = { enable = true } })
	end,
}
