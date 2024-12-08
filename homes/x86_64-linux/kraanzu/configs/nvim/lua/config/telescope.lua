local builtin = require("telescope.builtin")

-- Keymaps
vim.keymap.set("n", "<leader>tp", builtin.git_files, {})
vim.keymap.set("n", "<leader>tr", builtin.live_grep, {})
vim.keymap.set("n", "<leader>tb", builtin.buffers, {})

-- Setup
require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=auto",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.99,
			height = 0.99,
			preview_cutoff = 120,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			n = { ["q"] = require("telescope.actions").close },
		},
	},
})
