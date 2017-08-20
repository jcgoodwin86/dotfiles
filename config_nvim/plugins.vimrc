let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

" vim-jsx
let g:jsx_ext_required = 0 " so it will work on .js files

" deoplete
" let g:deoplete#enable_at_startup = 1
