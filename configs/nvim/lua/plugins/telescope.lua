return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>tp", builtin.git_files, {})
			vim.keymap.set("n", "<leader>tr", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>tb", builtin.buffers, {})
		end,
	},
}
