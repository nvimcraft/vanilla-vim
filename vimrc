" ---------------------------------------------------------------------------
" Order of operations matters in Vim. This file deliberately:
"   1. Sets defensive options (modeline/secure) BEFORE anything else.
"   2. Enables filetype detection in one canonical call.
"   3. Sources modular config in dependency order:
"        options -> appearance -> editing -> mappings
" ---------------------------------------------------------------------------

" Re-source guard.
if exists('g:loaded_vimrc')
    finish
endif
let g:loaded_vimrc = 1

set nomodeline           " disable inline 'vim:' directives from untrusted files
set modelines=0          " belt-and-suspenders; even if 'modeline' flips back on
set secure               " disallow :autocmd, shell, write commands from local rc

" Bootstrap persistent-state directories ONLY if missing. Cheap, but avoids
" running mkdir on every startup once they exist.
for s:dir in [$HOME . '/.vim/data/backup', $HOME . '/.vim/data/swap', $HOME . '/.vim/data/undo']
    if !isdirectory(s:dir)
        call mkdir(s:dir, 'p', 0700)
    endif
endfor
unlet s:dir

" Filetype detection + ftplugin + indent in one call. Must happen before any
" 'syntax enable' in appearance.vim and before per-filetype autocmds load.
filetype plugin indent on

" Sourced in dependency order.
source $HOME/.vim/config/options.vim
source $HOME/.vim/config/appearance.vim
source $HOME/.vim/config/editing.vim
source $HOME/.vim/config/mappings.vim

