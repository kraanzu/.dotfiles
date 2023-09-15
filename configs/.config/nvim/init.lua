vim.cmd([[
set termguicolors
]])

-- essentials
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.vsnip_snippet_dir = "~/.config/vsnip"
vim.api.nvim_set_keymap("n", "<leader>ff", ":Neoformat<cr>", { noremap = true })

-- setup plugins
require("plugins")

-- extras
vim.cmd([[
colorscheme nord
hi Normal guibg=NONE
]])
