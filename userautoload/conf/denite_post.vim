" denite_post.vim
call denite#custom#source('file/rec', 'matchers', ['matcher/fuzzy'])

" Use existing map to define a custom map
call denite#custom#map('normal', '<C-k>', '<C-b>')
call denite#custom#map('normal', '<C-j>', '<C-f>')

" Change file/rec command.
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" Ripgrep command on grep source
call denite#custom#var('grep', {
  \ 'command': ['rg'],
  \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
  \ 'recursive_opts': [],
  \ 'pattern_opt': ['--regexp'],
  \ 'separator': ['--'],
  \ 'final_opts': [],
  \ })

" Change default prompt
call denite#custom#option('default', 'prompt', '>')

