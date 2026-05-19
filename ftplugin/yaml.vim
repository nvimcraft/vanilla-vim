vim9script

# YAML filetype settings
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

# Format with Vim indent (no standard CLI formatter)
nnoremap <buffer> <leader>fm gg=G<C-o>
