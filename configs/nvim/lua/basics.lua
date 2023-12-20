vim.opt.termguicolors = true
vim.g.gitgutter_terminal_reports_focus = 0
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.vsnip_snippet_dir = "~/.config/vsnip"
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})
