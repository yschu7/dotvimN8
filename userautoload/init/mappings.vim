" --------
" Mappings
" --------
" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","
let maplocalleader = "\\"

" Make Y behave like other capital commands.
" Hat-tip http://vimbits.com/bits/11
nnoremap Y y$

" https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim
" copy selected text to system clipboard
if has("mac")
  noremap <silent> <leader>y :w !pbcopy<CR><CR>
elseif has("unix")
  noremap <silent> <leader>y :w !xclip -i -sel c<CR><CR>
endif

" Create newlines without entering insert mode
nnoremap go o<Esc>k
nnoremap gO O<Esc>j

" remap U to <C-r> for easier redo
" from http://vimbits.com/bits/356
nnoremap U <C-r>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Use very magic (Perl-like) regex style
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Make line completion easier.
inoremap <C-l> <C-x><C-l>

" Scroll larger amounts with C-j / C-k
nnoremap <silent> <C-j> 15gjzz
nnoremap <silent> <C-k> 15gkzz
vnoremap <silent> <C-j> 15gjzz
vnoremap <silent> <C-k> 15gkzz

" --------------------
" Insert Mode Mappings
" --------------------
" Let's make escape better, together.
" Replace by ./plugcfg/vim-arpeggio.vim
"inoremap jk <Esc>
"inoremap kj <Esc>

"-------------
" YS mappings
"-------------
" map ctrl-c to something else so I quit using it
nnoremap <c-c> <Nop>
inoremap <c-c> <Nop>

" Turn off highlighting after search
nnoremap <silent> <leader>/ :nohlsearch<CR>

" list and select buffer
nnoremap <silent> <leader>d :bd<CR>

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
noremap <silent> <leader>v :sp $MYVIMRC<CR><C-W>_
noremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ,h brings up my Vim-notes.txt
noremap <silent> <leader>h :sp ~/.vim/help/Vim-notes.txt<CR><C-W>_:set filetype=help<CR>:set foldmethod=marker<CR>

" for when we forget to use sudo to open/edit a file
cnoremap w!! w !sudo tee % >/dev/null

" It takes current line as input and execute the command and reads the output
" into the buffer. $SHELL is your default shell, you can change it..
" yyp - copy the original command line
nnoremap Q yyp<esc>!!$SHELL <cr>

" Quickly switch to last buffer (use default: Ctrl-^)
"nnoremap <leader>, :e#<CR>

" Underline the current line with '-'
nnoremap <silent> <leader>ul :t.\|s/./-/\|:nohls<cr>

" Underline the current line with '='
nnoremap <silent> <leader>uul :t.\|s/./=/\|:nohls<cr>

" Surround the commented line with lines.
" Example:
"          # Test 123
"          becomes
"          # --------
"          # Test 123
"          # --------
nnoremap <silent> <leader>cul :normal "lyy"lpwv$r-^"lyyk"lP<cr>

" Swap v and CTRL-V, because Block mode is more useful that Visual mode
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" Search for visually highlighted text (From: VimTips)
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" Insert date
inoreabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

" -------------------
" Update dein plugins
" -------------------
nnoremap <Leader>pi :call dein#install()<CR>
nnoremap <Leader>pu :call dein#update()<CR>
