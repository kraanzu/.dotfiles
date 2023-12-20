return {
	-- LANGAUGE SPECIFIC
	{ "dag/vim-fish", ft = { "fish" } },
	{ "cespare/vim-toml", ft = { "toml" } },
	{ "rust-lang/rust.vim", ft = { "rs" } },
	{
		"simrat39/rust-tools.nvim",
		ft = { "rs" },
		config = function()
			require("rust-tools").setup({})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = { "md" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
