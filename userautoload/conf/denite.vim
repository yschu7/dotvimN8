" denite.vim
nnoremap [denite] <Nop>
xnoremap [denite] <Nop>
nmap <Leader>f [denite]
xmap <Leader>f [denite]
imap <Leader>f <C-\><C-N>[denite]

nnoremap <silent> [denite]f :<C-U>Denite file<CR>
nnoremap <silent> [denite]r :<C-U>Denite file/rec<CR>
nnoremap <silent> [denite]u :<C-U>Denite file_mru<CR>
nnoremap <silent> [denite]p :<C-U>Denite -resume<CR>
nnoremap <silent> [denite]R :<C-U>Denite -buffer-name=registers register<CR>
nnoremap <silent> [denite]b :<C-U>Denite buffer<CR>
nnoremap <silent> [denite]g :<C-U>DeniteCursorWord grep<CR>

" denite
"    <C-o>      open Denite-file-buffer-list
"    <Esc> or q close Denite-file-buffer-list
"    <Space>    toggle:select multiple files/buffers
"    <CR> or o  open files/buffers
"    p          preview files in split windows
"    d          delete buffers (NOT files)
"    s          open files/buffers in split windows (horizonal)
"    v          open files/buffers in split windows (vertical)
"    i          filter by your input string
"    ..         move to directory above (cd ..)
nnoremap <silent> <C-o> :<C-u>Denite file buffer file:new<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
        nnoremap <silent><buffer><expr> <Esc>
                \ denite#do_map('quit')
        nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
        nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select').'j'
        nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
        nnoremap <silent><buffer><expr> o
                \ denite#do_map('do_action')
        nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
        nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
        nnoremap <silent><buffer><expr> s
                \ denite#do_map('do_action', 'split')
        nnoremap <silent><buffer><expr> v
                \ denite#do_map('do_action', 'vsplit')
        nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
        nnoremap <silent><buffer><expr> ..
                \ denite#do_map('move_up_path')
endfunction
