" Markdown filetype settings
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2
setlocal textwidth=80

" Format with prettier if available, otherwise indent whole file
if executable('prettier')
  nnoremap <buffer> <leader>fm :silent execute '%!prettier --stdin-filepath ' . shellescape(expand('%'))<CR>
else
  nnoremap <buffer> <leader>fm gg=G<C-o>
endif
