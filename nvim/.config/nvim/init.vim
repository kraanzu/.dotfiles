" filetype plugin on

lua require('plugins')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

let mapleader = " "
nnoremap <leader>ff :Neoformat<cr>

nmap <F8> :TagbarToggle<CR>
colorscheme nord
