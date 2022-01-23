filetype plugin on

call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

" MAKING LIFE EASIER
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sbdchd/neoformat'
Plug 'preservim/tagbar'
" Plug 'davidhalter/jedi-vim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" AUTOCOMPLETE BABY
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'

" GIT STUFF
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'

" MISCS
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'

"EYE CANDY
Plug 'arcticicestudio/nord-vim' " nord colorscheme
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/todo-comments.nvim'

" LANGAUGE STUFF
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'

call plug#end()

let mapleader = " "
nnoremap <leader>ff :Neoformat<cr>

nmap <F8> :TagbarToggle<CR>
colorscheme nord
