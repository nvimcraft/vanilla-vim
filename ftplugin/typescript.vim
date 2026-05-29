" 2-space indent (Prettier default).
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

nnoremap <buffer> <silent> <leader>fm :call utils#PrettierPipe()<CR>

