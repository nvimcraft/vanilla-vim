" Indent (global defaults; ftplugins override per language)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Wrapping
set wrap
set linebreak            " wrap at word boundaries, not mid-word
set breakindent          " visually preserve indent on wrapped lines
set textwidth=0          " let ftplugins set this per filetype

" Backspace
set backspace=indent,eol,start

" Completion (built-in; no external LSP)
" menuone: show menu even with one match (so we can see what we're picking)
" noinsert: don't auto-insert the first completion
" noselect: don't auto-select either; user picks explicitly
set completeopt=menuone,noinsert,noselect

" Format options
" Defaults (Vim 9.1) are "tcqj". We extend with:
"   r  auto-insert comment leader on <Enter> in insert mode
"   o  auto-insert comment leader on 'o'/'O' in normal mode
"   l  don't break already-long lines on insert
" We keep 'j' so 'J' removes the comment leader when joining.
set formatoptions=tcqjrol
