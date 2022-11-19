"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set rtp+=~/.vim/

" init scripts directory:  ~/.vim/userautoload/init
runtime! userautoload/init/*.vim

let s:dein_dir = expand('~/.vim/dein')
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " Let dein manage dein
  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
    call dein#add('machakann/vim-highlightedyank')
  endif

  " plugins toml directory: ~/.vim/userautoload/toml
  call dein#load_toml('~/.vim/userautoload/toml/plugins.toml', {'lazy': 0})
  call dein#load_toml('~/.vim/userautoload/toml/lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

