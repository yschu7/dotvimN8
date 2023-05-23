" ----------------------------------------
" Commands
" ----------------------------------------
" Silently execute an external command
" No 'Press Any Key to Contiue BS'
" from: http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
" :help nargs
" command! -nargs=1 SilentCmd
" \   execute ':silent !'.<q-args>
" \ | execute ':redraw!'

" Fixes common typos
"command! W w
"command! Q q

" ripgrep Vim integration
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  command! -nargs=1 Grep
  \   execute ':silent grep '.<q-args>
  \ | execute ':redraw!'
  command! -nargs=1 Lgrep execute ':silent lgrep '.<q-args>
endif

