" 2-space indent (Prettier/Standard/Airbnb default).
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

" Format buffer: prettier via defensive pipe (won't clobber on parse error),
" fall back to native indent if prettier is absent.
nnoremap <buffer> <silent> <leader>fm :call utils#PrettierPipe()<CR>
