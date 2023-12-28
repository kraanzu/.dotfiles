return {
	"heavenshell/vim-pydocstring",
	build = "make install",
	config = function()
		vim.g.pydocstring_formatter = "google"
        vim.api.nvim_set_keymap("n", "<leader>ds", ":Pydocstring<cr>", { noremap = true })
	end,
}
