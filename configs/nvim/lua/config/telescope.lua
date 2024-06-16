local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- Keymaps
vim.keymap.set("n", "<leader>tp", builtin.git_files, {})
vim.keymap.set("n", "<leader>tr", builtin.live_grep, {})
vim.keymap.set("n", "<leader>tb", builtin.buffers, {})

-- Setup
require("telescope").setup({
	defaults = {
		layout_strategy = "vertical", -- Use vertical layout strategy
		layout_config = {
			prompt_position = "bottom", -- Position prompt at the top
			width = 0.99, -- Full width of the screen
			height = 0.99, -- Full height of the screen
			preview_cutoff = 15, -- Adjust preview cutoff if needed
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
})
