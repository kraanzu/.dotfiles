return {
	{
		"sbdchd/neoformat",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>ff", ":Neoformat<cr>", { noremap = true })
		end,
	},
}
