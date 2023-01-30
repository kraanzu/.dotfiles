vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd([[
set termguicolors
]])
vim.g.vsnip_snippet_dir = "~/.config/vsnip"

require("plugins")

vim.api.nvim_set_keymap("n", "<leader>ff", ":Neoformat<cr>", { noremap = true })

vim.cmd([[
set termguicolors
colorscheme nord
hi Normal guibg=NONE
]])
