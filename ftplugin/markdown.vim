setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal textwidth=80
setlocal linebreak
setlocal wrap

" Spell check on by default for prose.
setlocal spell
setlocal spelllang=en_us

" Fold by section using built-in markdown syntax (no plugin needed).
setlocal foldmethod=expr
setlocal foldexpr=getline(v:lnum)=~'^#'?'>'.(len(matchstr(getline(v:lnum),'^#\\+'))):'='

" Markdown hard-line-breaks are two trailing spaces. The trailing-whitespace
" stripper in after/plugin/autocmds.vim excludes this filetype.

nnoremap <buffer> <silent> <leader>fm gg=G<C-o>
