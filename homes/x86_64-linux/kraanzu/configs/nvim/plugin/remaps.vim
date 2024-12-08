noremap <Up> :Neogit<CR>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> :G push<CR>

" clear highlights as well
noremap <silent> <C-L> :nohlsearch<CR><C-L>

imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Buffer stuff
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <C-q> :bd<CR>
nmap <F12> :TagbarToggle<CR>

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

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
