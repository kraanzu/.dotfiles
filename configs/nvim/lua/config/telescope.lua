local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>tp", builtin.git_files, {})
vim.keymap.set("n", "<leader>tr", builtin.live_grep, {})
vim.keymap.set("n", "<leader>tb", builtin.buffers, {})

require("telescope").setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
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
    },
})
