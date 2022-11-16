" NERDTree
nnoremap <silent><leader>nn :NERDTreeToggle<CR>:wincmd =<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>:wincmd =<CR>
nnoremap <silent><leader>nt :NERDTree<CR>

function! s:nt_settings()
  nmap <buffer> <C-J> 10j
  nmap <buffer> <C-K> 10k
endfunction

augroup nt_group
  autocmd!
  autocmd FileType nerdtree call s:nt_settings()
  " Close Vim if NERDTree is the last buffer
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
    \&& b:NERDTreeType == "primary") | q | endif
augroup END

let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeMinimalUI = 1

