" ---------------
" Auto Commands
" ---------------

" AutoCommands settings  {{{
if has("autocmd")
  augroup MyAutoCommands
    " Clear the auto command group so we don't define it multiple times
    autocmd!
    " No formatting on o key newlines
    autocmd BufNewFile,BufEnter * set formatoptions-=o

    " No more complaining about untitled documents
    autocmd FocusLost silent! :wa

    " When editing a file, always jump to the last cursor position.
    " This must be after the uncompress commands.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line ("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

    " Add missing imports on save
    autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

    " Fix trailing whitespace in my most used programming langauges
    autocmd BufWritePre *.py,*.coffee,*.rb,*.erb,*.swift,*.scss,*.vim,
          \*.php,*.js,*.sql,*.plsql,*.c,*.cpp,*.java,*.kt,*.go,*.jl
          \ silent! :StripTrailingWhiteSpace

    " ----------
    " Filetypes
    " ----------
    " Help mode bindings
    " <enter> to follow tag, <bs> to go back, and q to quit.
    autocmd FileType help nnoremap <buffer><CR> <c-]>
    autocmd FileType help nnoremap <buffer><ESC> <C-T>
    autocmd Filetype help nnoremap <buffer>q :q<CR>

    " Fix accidental indentation in html files
    " from http://morearty.com/blog/2013/01/22/fixing-vims-indenting-of-html-files.html
    autocmd FileType html setlocal indentkeys-=*<Return>

    " Leave the return key alone when in command line windows, since it's used
    " to run commands there.
    autocmd! CmdwinEnter * :unmap <cr>
    autocmd! CmdwinLeave * :call MapCR()

    " Resize splits when the window is resized
    " from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
    au VimResized * :wincmd =

    " Auto change the directory to the current file I'm working on
    "autocmd BufEnter * lcd %:p:h

    " make the following files plsql files
    au BufNewFile,BufRead *.fun,*.pks,*.pkb,*.sql,*.pls,*.plsql setlocal filetype=plsql
    au FileType plsql runtime! indent.vim

    " If we're editing a .txt file then skip line numbers
    autocmd BufRead,BufNewFile *.txt setlocal nonu
    " ansible
    au BufNewFile,BufRead */*book*/*.yml setlocal filetype=yaml.ansible

    autocmd BufEnter *.txt call HelpInNewTab()
    "Only apply to help files
    fun! HelpInNewTab()
      if &buftype == 'help'
        "Convert the help window to a tab
        execute "normal \<C-W>T"
      endif
    endfun

    " set matchpairs for markup languanges
    autocmd FileType xml   setlocal matchpairs+=<:>
    autocmd FileType html  setlocal matchpairs+=<:>

    " Automatic fold settings for specific files.
    autocmd FileType ruby  setlocal foldmethod=syntax
    autocmd FileType vim   setlocal foldmethod=marker
    autocmd FileType css   setlocal foldmethod=indent shiftwidth=2 tabstop=2 softtabstop=2

    au FileType python,swift,java,kotlin setlocal fdm=indent sw=4 ts=4 sts=4

    au FileType markdown setlocal fdm=marker ts=4 sw=4 sts=4 nospell
    au FileType go setlocal fdm=indent ts=4 sw=4 sts=0 noexpandtab

    au FileType ruby,python,java,swift,javascript,php,rust,sh,vim,go setlocal matchpairs-=<:>
    au FileType c,cpp,plsql,coffee,lua,kotlin,groovy setlocal matchpairs-=<:>

    " automatically give executable permissions if file begins with #! and
    " contains '/bin/' in the path (replaced by vim-eunuch)
    fun! AfterWrite()
      if getline(1) =~ "^#!" && getline(1) =~ "/bin/"
        silent !chmod a+x <afile>
      endif
    endfun
    autocmd BufWritePost * call AfterWrite()

    fun! RustCompileAndRun()
      silent !clear
      execute "! rustc " . expand('%:t') . " && ./" . expand('%:r')
    endfun

    fun! JavaCompileAndRun()
      silent !clear
      execute "! javac " . expand('%:t') . " && java " . expand('%:r')
    endfun

    fun! KotlinCompileAndRun()
      silent !clear
      execute "! kotlinc -include-runtime " . expand('%:t') . " -d " . expand('%:r') . ".jar && java -jar " . expand('%:r') . ".jar"
    endfun

    fun! AsciiCompileAndOpen()
      silent !clear
      execute "! asciidoctor " . expand('%:t') . " && open -a '/Applications/Google Chrome.app'  ./" . expand('%:r') . ".html"
    endfun

    " Define <F5> depends on filetype
    autocmd FileType swift nnoremap <buffer><F5> <ESC>:up!<CR>:!xcrun swift ./%<CR>
    autocmd FileType swift inoremap <buffer><F5> <ESC>:up!<CR>:!xcrun swift ./%<CR>
    autocmd FileType javascript nnoremap <buffer><F5> <ESC>:up!<CR>:!node ./%<CR>
    autocmd FileType javascript inoremap <buffer><F5> <ESC>:up!<CR>:!node ./%<CR>
    autocmd FileType ruby nnoremap <buffer><F5> <ESC>:up!<CR>:!ruby ./%<CR>
    autocmd FileType ruby inoremap <buffer><F5> <ESC>:up!<CR>:!ruby ./%<CR>
    autocmd FileType python nnoremap <buffer><F5> <ESC>:up!<CR>:!python3 ./%<CR>
    autocmd FileType python inoremap <buffer><F5> <ESC>:up!<CR>:!python3 ./%<CR>
    autocmd FileType groovy nnoremap <buffer><F5> <ESC>:up!<CR>:!groovy ./%<CR>
    autocmd FileType groovy inoremap <buffer><F5> <ESC>:up!<CR>:!groovy ./%<CR>
    autocmd FileType vim nnoremap <buffer><F5> <ESC>:up!<CR>:source ./%<CR>
    autocmd FileType vim inoremap <buffer><F5> <ESC>:up!<CR>:source ./%<CR>
    autocmd FileType sh nnoremap <buffer><F5> <ESC>:up!<CR>:!clear<CR>:!bash ./%<CR>
    autocmd FileType sh inoremap <buffer><F5> <ESC>:up!<CR>:!clear<CR>:!bash ./%<CR>
    autocmd FileType rust nnoremap <buffer><F5> <ESC>:up!<CR>:call RustCompileAndRun()<CR>
    autocmd FileType rust inoremap <buffer><F5> <ESC>:up!<CR>:call RustCompileAndRun()<CR>
    autocmd FileType asciidoc nnoremap <buffer><F5> <ESC>:up!<CR>:call AsciiCompileAndOpen()<CR>
    autocmd FileType asciidoc inoremap <buffer><F5> <ESC>:up!<CR>:call AsciiCompileAndOpen()<CR>
    autocmd FileType java nnoremap <buffer><F5> <ESC>:up!<CR>:call JavaCompileAndRun()<CR>
    autocmd FileType java inoremap <buffer><F5> <ESC>:up!<CR>:call JavaCompileAndRun()<CR>
    autocmd FileType kotlin nnoremap <buffer><F5> <ESC>:up!<CR>:call KotlinCompileAndRun()<CR>
    autocmd FileType kotlin inoremap <buffer><F5> <ESC>:up!<CR>:call KotlinCompileAndRun()<CR>
    autocmd FileType markdown nnoremap <buffer><F5> <ESC>:up!<CR>:MarkedOpen!<CR>
    autocmd FileType markdown inoremap <buffer><F5> <ESC>:up!<CR>:MarkedOpen!<CR>
    autocmd FileType lua nnoremap <buffer><F5> <ESC>:up!<CR>:!lua ./%<CR>
    autocmd FileType lua inoremap <buffer><F5> <ESC>:up!<CR>:!lua ./%<CR>
    autocmd FileType php nnoremap <buffer><F5> <ESC>:up!<CR>:!php ./%<CR>
    autocmd FileType php inoremap <buffer><F5> <ESC>:up!<CR>:!php ./%<CR>
    autocmd FileType julia nnoremap <buffer><F5> <ESC>:WriteBufferIfNecessary<CR>:!julia ./%<CR>
    autocmd FileType julia inoremap <buffer><F5> <ESC>:WriteBufferIfNecessary<CR>:!julia ./%<CR>
    autocmd FileType julia nmap <buffer> ? <Plug>(JuliaDocPrompt)

    autocmd FileType go nnoremap <buffer><F5> <ESC>:WriteBufferIfNecessary<CR>:!go run %<CR>
    autocmd FileType go inoremap <buffer><F5> <ESC>:WriteBufferIfNecessary<CR>:!go run %<CR>

    " [Buffer-Local](http://learnvimscriptthehardway.stevelosh.com/chapters/11.html)
    " tmux run script (Split screen to show result)
    au FileType ruby nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("ruby ".expand('%:p')."\n")<CR>
    au FileType python nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("python ".expand('%:p')."\n")<CR>
    au FileType groovy nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("groovy ".expand('%:p')."\n")<CR>
    au FileType go nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("go run ".expand('%:p')."\n")<CR>
    au FileType javascript nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("node ".expand('%:p')."\n")<CR>
    au FileType coffee nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("coffee ".expand('%:p')."\n")<CR>
    au FileType rust nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("clear && rustc ".expand('%:t')." && ./".expand('%:r')."\n")<CR>
    au FileType java nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("clear && javac ".expand('%:t')." && java ".expand('%:t:r')."\n")<CR>
    au FileType lua nnoremap <buffer><leader>tx :up!<CR>:call VimuxRunCommand("lua ".expand('%:p')."\n")<CR>
    " Leave paste mode on exit
    au InsertLeave * set nopaste

    " Set path
    " autocmd BufEnter *.rb set path+=~/ruby/**
    " autocmd BufEnter *.py set path+=~/python/**
  augroup END
endif
" }}}
