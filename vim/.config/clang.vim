" Clang format
if !executable('clang-format') && executable('clang-format-6.0')
    let g:clang_format#command = 'clang-format-6.0'
endif

autocmd FileType c,h,cpp,hpp noremap <leader>f :ClangFormat<CR>
autocmd FileType c,h,cpp,hpp inoremap <leader>f <esc>:ClangFormat<CR>

" Clang rename
let g:clang_rename#command='clang-rename-6.0'

map <A-r> :ClangRenameCurrent<CR>
