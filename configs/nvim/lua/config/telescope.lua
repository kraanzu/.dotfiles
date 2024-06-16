local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- Keymaps 
vim.keymap.set("n", "<leader>tp", builtin.git_files, {})
vim.keymap.set("n", "<leader>tr", builtin.live_grep, {})
vim.keymap.set("n", "<leader>tb", builtin.buffers, {})


-- Setup
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}
