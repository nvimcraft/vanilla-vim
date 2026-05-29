" YAML filetype settings
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4

" Format with prettier if available, otherwise Vim indent
if executable('prettier')
    nnoremap <buffer> <leader>fm :silent execute '%!prettier --stdin-filepath ' . shellescape(expand('%'))<CR>
else
    nnoremap <buffer> <leader>fm gg=G<C-o>
endif
