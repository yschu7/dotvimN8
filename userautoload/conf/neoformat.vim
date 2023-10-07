" Neoformat

" Run a formatter on save
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

" Python
let g:neoformat_python_yapf = {
            \ 'exe': 'yapf',
            \ }
let g:neoformat_enabled_python = ['yapf']

" Csharp
let g:neoformat_python_csharp = {
            \ 'exe': 'dotnet-csharpier',
            \ }
let g:neoformat_enabled_csharp = ['dotnet-csharpier']

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
