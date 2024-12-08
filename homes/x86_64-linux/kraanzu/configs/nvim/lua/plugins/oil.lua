return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = true,
			lsp_file_methods = {
				autosave_changes = true,
			},
			constrain_cursor = "editable",
			watch_for_changes = true,
			view_options = {
				show_hidden = false,
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, ".")
				end,
				is_always_hidden = function(name, bufnr)
					return false
				end,
			},
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
