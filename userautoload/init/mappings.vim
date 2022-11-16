" ---------
" Mappings
" ---------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","
let maplocalleader = "\\"

" -----------------------
" Unmapped While Learning
" -----------------------

" No-op ^ and $ while learning H and L
" noremap ^ <nop>
" noremap $ <nop>
" nnoremap <leader>sc <nop>

" ---------------
" Regular Mappings
" ---------------

" Use ; for : in normal and visual mode, less keystrokes
" nnoremap ; :
" vnoremap ; :

" Yank entire buffer with gy
nnoremap gy :0,$ y<cr>

" Select entire buffer
nnoremap vy ggVG

" Make Y behave like other capital commands.
" Hat-tip http://vimbits.com/bits/11
nnoremap Y y$

" Just to beginning and end of lines easier. From http://vimbits.com/bits/16
" noremap H ^
" noremap L $

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

" ---------------
" Window Movement
" ---------------
" nnoremap <silent> gh :WriteBufferIfNecessary<CR>:wincmd h<CR>
" nnoremap <silent> gj :WriteBufferIfNecessary<CR>:wincmd j<CR>
" nnoremap <silent> gk :WriteBufferIfNecessary<CR>:wincmd k<CR>
" nnoremap <silent> gl :WriteBufferIfNecessary<CR>:wincmd l<CR>

" Neovim : Alt + h, j, k, l (define @ yscust.vim)

"   Splits Horizontal
"   -----------------
"        | g1 | g2
"        | -> | ->
"   -----------------
"   Splits Vertical
"   -----------------
"   ----------- | ---
"          g3   v
"   ----------- | ---
"          g4   v
"   -----------------
nnoremap <silent> g1 :WriteBufferIfNecessary<CR>:wincmd s<CR>
nnoremap <silent> g2 :WriteBufferIfNecessary<CR>:wincmd s<bar>:wincmd s<CR>
nnoremap <silent> g3 :WriteBufferIfNecessary<CR>:wincmd v<CR>
nnoremap <silent> g4 :WriteBufferIfNecessary<CR>:wincmd v<bar>:wincmd v<CR>

" Split window vertically or horizontally *and* switch to the new split!
" nnoremap <silent> <leader>sp  :split<Bar>:wincmd j<CR>
" nnoremap <silent> <leader>vsp :vsplit<Bar>:wincmd l<CR>

" Previous Window
nnoremap <silent> gp :wincmd p<CR>
" Equal Size Windows
nnoremap <silent> g= :wincmd =<CR>
" Swap Windows
nnoremap <silent> gx :wincmd x<CR>
" Close Window
nnoremap <silent> gz :close!<CR>

" ---------------
" Modifer Mappings
" ---------------

" Make line completion easier.
inoremap <C-l> <C-x><C-l>

" Scroll larger amounts with C-j / C-k
nnoremap <C-j> 15gjzz
nnoremap <C-k> 15gkzz
vnoremap <C-j> 15gjzz
vnoremap <C-k> 15gkzz

" --------------------
" Insert Mode Mappings
" --------------------

" Let's make escape better, together. Ctrl-[
" Replace by ./plugcfg/vim-arpeggio.vim
"inoremap jk <Esc>
"inoremap kj <Esc>

" ---------------
" Leader Mappings
" ---------------

" Clear search
noremap <silent><leader>/ :nohls<CR>

" Highlight search word under cursor without jumping to next
"nnoremap <leader>h *<C-O>

"-------------
" YS mappings
"-------------
" map ctrl-c to something else so I quick using it
nnoremap <c-c> <Nop>
inoremap <c-c> <Nop>

" visual mode indent with <TAB> and <S-TAB>
"nnoremap <TAB> v>
"nnoremap <s-TAB> v<
vnoremap <TAB> >gv
vnoremap <s-TAB> <gv

" show the registers from things cut/yanked
nnoremap <leader>r :registers<CR>

" map the various registers to a leader shortcut for pasting from them
nnoremap <leader>0 "0p
nnoremap <leader>1 "1p
"nnoremap <leader>k "kp

" Press Ctrl-N to turn off highlighting.
nnoremap <silent> <C-N> :silent noh<CR>
nnoremap <silent> <BS> :nohlsearch<CR>

" list and select buffer
nnoremap <silent> <leader>l :ls<CR>:b
nnoremap <silent> <leader>d :bd<CR>
nnoremap <silent> <leader>n :bn<CR>
nnoremap <silent> <leader>p :bp<CR>
" nnoremap <leader>w :w<CR>

" Close preview buffer
nnoremap <silent> <leader>x :pclose<CR>

" Actions after helpgrep
" nnoremap <leader>cn :cnext<CR>
" nnoremap <leader>cnf :cnfile<CR><C-G>
" nnoremap <leader>cp :cprev<CR>
" nnoremap <leader>cpf :cpfile<CR><C-G>
" shortcuts to open/close the quickfix window
" nmap <leader>co :copen<CR>
" nmap <leader>cc :cclose<CR>

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
noremap <silent> <leader>v :sp $MYVIMRC<CR><C-W>_
noremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ,h brings up my Vim-notes.txt
noremap <silent> <leader>h :sp ~/.vim/help/Vim-notes.txt<CR><C-W>_:set filetype=help<CR>

" for when we forget to use sudo to open/edit a file
cnoremap w!! w !sudo tee % >/dev/null

" It takes current line as input and execute the command and reads the output
" into the buffer. $SHELL is your default shell, you can change it..
" yyp - copy the original command line
nnoremap Q yyp<esc>!!$SHELL <cr>

" Copy the entire buffer into the system register
nnoremap <leader>co ggVG*y

"---------
" Windows
"---------
" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
"inoremap <C-W> <C-O><C-W>

" use - and + to resize horizontal splits
nnoremap - <C-W>-
nnoremap + <C-W>+

" and for vsplits with <TAB> and Shift<TAB>
nnoremap <TAB> <C-W>>
nnoremap <s-TAB> <C-W><

" Quickly switch to last buffer
nnoremap <leader>, :e#<CR>

" Underline the current line with '-'
nnoremap <silent> <leader>ul :t.\|s/./-/\|:nohls<cr>

" Underline the current line with '='
nnoremap <silent> <leader>uul :t.\|s/./=/\|:nohls<cr>

" Surround the commented line with lines.
"
" Example:
"          # Test 123
"          becomes
"          # --------
"          # Test 123
"          # --------
nnoremap <silent> <leader>cul :normal "lyy"lpwv$r-^"lyyk"lP<cr>

" Format the entire file
nnoremap <leader>fef mx=ggG='x

" Format a json file with Python's built in json.tool.
" from https://github.com/spf13/spf13-vim/blob/3.0/.vimrc#L390
nnoremap <leader>jt <Esc>:%!underscore print<CR><Esc>:set filetype=json<CR>
nnoremap <leader>jts <Esc>:%!underscore print --strict<CR><Esc>:set filetype=json<CR>

" Swap v and CTRL-V, because Block mode is more useful that Visual mode
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" ~/.vim/pref/vmath.vim
vmap <expr> ++  VMATH_YankAndAnalyse()
nmap        ++  vip++

" ~/.vim/pref/dragvisuals.vim
vmap <expr> <LEFT>   DVB_Drag('left')
vmap <expr> <RIGHT>  DVB_Drag('right')
vmap <expr> <DOWN>   DVB_Drag('down')
vmap <expr> <UP>     DVB_Drag('up')
vmap <expr> D        DVB_Duplicate()

" ---------------
" Typo Fixes
" ---------------

cnoremap w' w<CR>

" Removes doc lookup mapping because it's easy to fat finger and never useful.
"nnoremap K k
"vnoremap K k

" Insert date
inoreabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

noreabbrev teh the
noreabbrev Wq wq

" copy current file name (relative/absolute) to system clipboard
" from http://stackoverflow.com/a/17096082/22423
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <silent> <leader>yp :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <silent> <leader>yP :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <silent> <leader>yf :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <silent> <leader>yd :let @*=expand("%:p:h")<CR>

  " Open current file in Marked.
  nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>: !<cr>
endif

"Update dein plugins
nnoremap <Leader>pi :call dein#install()<CR>
nnoremap <Leader>pu :call dein#update()<CR>

