require "plugins"

vim.g.mapleader = " "
vim.g.vsnip_snippet_dir = "~/.config/vsnip"

vim.api.nvim_set_keymap("n", "<leader>ff", ":Neoformat<cr>", { noremap = true })

vim.cmd([[
packadd nvim-treesitter
colorscheme nord
hi Normal guibg=NONE
]])
