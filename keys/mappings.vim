"Better Navigation
nnoremap 0 ^
nnoremap j gj
nnoremap k gk

"Keep visual mode after indenting
vnoremap > >gv
vnoremap < <gv

"Move visual blocks
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Scrolling
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

"Ctrl+h for backspace in insert mode
imap <C-h> <BS>

"Ctrl+j for Enter
imap <C-j> <CR>
