" ---------------
" Neovim settings
" ---------------

" Preview changes on :substitute command
set inccommand=nosplit
" Exit Terminal buffer with ESC key
tnoremap <Esc> <C-\><C-n>
" Send ESC key in Terminal buffer
tnoremap <A-[> <Esc>
" Window switching in terminal mode
tnoremap <a-h> <c-\><c-n><c-w>h
tnoremap <a-j> <c-\><c-n><c-w>j
tnoremap <a-k> <c-\><c-n><c-w>k
tnoremap <a-l> <c-\><c-n><c-w>l
" Window switching in normal mode
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
" Pasting a register in terminal mode
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
" highlighting a selection on yank
au TextYankPost * silent! lua vim.highlight.on_yank()
