" ---------------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ---------------------------------------------

" ---------------
" Color
" ---------------
" Force 256 color mode if available or Unix like systems
if !has('nvim')
  if $TERM =~ "-256color" || has('unix')
    set t_Co=256
  endif
else
  set termguicolors          " True color support in nvim
endif

"set background=dark
"colorscheme jellybeans
"colorscheme gruvbox
"colorscheme solarized8_high
set background=dark
autocmd vimenter * ++nested colorscheme solarized8_high

" -----------------------------
" File Locations
" -----------------------------
if exists('$SUDO_USER')
  set nobackup          " don't create root-owned files
  set nowritebackup
  set noswapfile
  set noundofile
  set viminfo=
else
  set backupdir=~/.vim/.backup// " Double // causes backups to use full file path
  set directory=~/.vim/.tmp//
  set spellfile=~/.vim/spell/en.utf-8.add  " spell checking file
  set spelllang=en,cjk           " Spell languages, prevent check Asia langs
  set spellsuggest=best,20       " Show 20 spell checking candidates at most
  " Persistent Undo
  if has('persistent_undo')
    set undofile
    set undodir=~/.vim/.undo
  endif
endif

" set path for searching cmd like: gf, <c-w>f, <c-w>gf
" use :set path< to copy this global value to local buffers
set path=.
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" ---------------
" UI
" ---------------
set ruler            " Ruler on
set number           " Line numbers on
set relativenumber   " Relative Number on
set wrap             " Line wrapping on
set linebreak        " not break in the middle of the word
let &showbreak='⤷ '  " symbol to shwo where the linebreak is (U+2937)
if v:version >= 800  " check vim version >= 8.0
  set breakindent    " indent wrapped lines to match start
endif
if exists('&breakindentopt')
  set breakindentopt=shift:2   " emphasize broken lines by indenting them
endif
" set fillchars=vert:┃         " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83))
set fillchars-=vert:\| |       " replace with a space

set cursorline       " nocursorline (cul/nocul)
set laststatus=2     " Always show the statusline
set cmdheight=2      " Make the command area two lines high
set encoding=utf-8
set fencs=utf-8,big5,gbk,latin1

set noshowmode       " Don't show the mode since Powerline shows it
set title            " Set the title of the window in the terminal to the file

if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif

" Disable tooltips for hovering keywords in Vim
if exists('+ballooneval')
  " This doesn't seem to stop tooltips for Ruby files
  set noballooneval
  " 100 second delay seems to be the only way to disable the tooltips
  set balloondelay=100000
endif

" ---------------
" Behaviors
" ---------------
syntax enable
set backup             " Turn on backups
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving: Handle multiple buffers better.
                       " You can have edited buffers that aren't visible in a window somewhere.
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
" set timeoutlen=450     " Time to wait for a command (after leader for example).
set ttimeout
set ttimeoutlen=100    " Time to wait for a command (after leader for example).
set nofoldenable       " Disable folding entirely.
set foldlevelstart=99  " Start unfolded
set formatoptions=crql
set iskeyword+=\$,-   " Add extra characters that are valid parts of variables
set nostartofline      " Don't go to the start of the line after some commands
set scrolloff=2        " Keep two lines below the last line when scrolling
" set gdefault           " this makes search/replace global by default
set switchbuf=useopen  " Switch to an existing buffer if one exists

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=indent,eol,start " Delete everything with backspace
set shiftwidth=2      " tab under insert mode : 2 spaces
set shiftround
set cindent
set autoindent
set smarttab
set expandtab

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search if only input lowercase
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*/node_modules/*,
  \rake-pipeline-*,vendor/gems/*

"set matchpairs+=<:>
" https://github.com/lilydjwg/dotvim/commit/880fc3b
try
  set matchpairs+=《:》,〈:〉,［:］,（:）,「:」,『:』,‘:’,“:”
catch /^Vim\%((\a\+)\)\=:E474/
endtry

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
set list        " Show invisible characters

" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw

" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:▸▸
" show trailing spaces as dots
set listchars+=trail:•
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<
" EOL
set listchars+=eol:¬

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes

" Better complete options to speed it up
" :h 'complete'
set complete=.,w,b,u,U,kspell
