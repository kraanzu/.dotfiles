packadd nvim-treesitter
lua require('plugins')

let mapleader = " "
nnoremap <leader>ff :Neoformat<cr>

if !has('gui_running')
  set t_Co=256
endif

colorscheme nord
hi Normal guibg=NONE
