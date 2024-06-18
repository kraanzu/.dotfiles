local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- Keymaps
vim.keymap.set("n", "<leader>tp", builtin.git_files, {})
vim.keymap.set("n", "<leader>tr", builtin.live_grep, {})
vim.keymap.set("n", "<leader>tb", builtin.buffers, {})

-- Setup
require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal", -- Use vertical layout strategy
		layout_config = {
			prompt_position = "bottom", -- Position prompt at the top
			width = 0.99, -- Full width of the screen
			height = 0.99, -- Full height of the screen
            -- set preview width to 0.65 of the screen
            preview_width = 0.5,
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
})
