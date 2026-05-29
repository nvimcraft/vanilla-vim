setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

" Fold Vim files by marker {{{ }}}. Manual but predictable.
setlocal foldmethod=marker

" K opens :help for the word under the cursor.
setlocal keywordprg=:help

nnoremap <buffer> <silent> <leader>fm gg=G<C-o>

