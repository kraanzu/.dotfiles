autocmd BufWritePre * :%s/\s\+$//e

" augroup Higlight
"     autocmd!
"     autocmd WinEnter,VimEnter * :silent! call matchadd('Todo','TODO\|FIXME\|XXX\|REVIEW\|HELP\|IMPORTANT', -1)
" augroup END
