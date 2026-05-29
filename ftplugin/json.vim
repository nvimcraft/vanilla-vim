" 2-space indent (community norm; matches package.json, tsconfig, etc.)
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

" Conceal nothing (default 'conceal' on JSON files hides quotes -- annoying).
setlocal conceallevel=0

" Format with jq if available, otherwise native indent. Deliberately NO
" python3 fallback: invoking /usr/bin/python3 on a fresh macOS triggers the
" Command Line Tools installer dialog under MDM, which is disruptive.
nnoremap <buffer> <silent> <leader>fm :call utils#JqPipe()<CR>

