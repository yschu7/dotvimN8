" ---------------
" Neovim settings
" ---------------
if has('nvim')
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
  " for git commit within :terminal
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
  " prefer using :x or :wq instead of :w | bd to finish
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
else
  " Vim
  runtime macros/matchit.vim
endif
