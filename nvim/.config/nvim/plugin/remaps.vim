noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <silent> <C-L> :nohlsearch<CR><C-L>

imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <C-q> :bd<CR>

"remove blank lines
nnoremap <leader>xx <cmd>g/^$/d<cr>

" keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo Break Points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u

"Jumplist Mutations
nnoremap <expr> j (v:count > 5 ? "m'"  . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'"  . v:count : "") . 'k'

" Moving Text

inoremap <c-k> <esc>:m .-2<CR>==i
inoremap <c-j> <esc>:m .+1<CR>==i

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
