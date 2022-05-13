set nocompatible
set number
set cursorline
set backspace=indent,eol,start
set showmode
set relativenumber
set mouse=a
set scrolloff=8
set tabstop=4
set shiftwidth=2
set expandtab
set hidden
set smartcase
set encoding=utf-8
set shell=/bin/bash
set completeopt=menu,menuone,noselect
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set termguicolors


set undofile
set undodir=~/.undodir
set updatetime=100

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Jump to start and end of line using the home row keys
map H ^
map L $
