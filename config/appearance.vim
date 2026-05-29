" UI Configuration
syntax on
set background=dark
set laststatus=2                                           " laststatus=3 (Vim 8.2+) shows ONE global statusline instead of per-window.
set showmode                                               " 'mode' shown by Vim itself in the cmdline area
set ruler                                                  " harmless fallback if statusline ever blanks
set statusline=
set statusline+=\ %f                                       " path
set statusline+=\ %h%m%r                                   " help/modified/readonly flags
set statusline+=%=                                         " right-align
set statusline+=\ %y                                       " filetype, e.g. [vim]
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}]                         " unix/dos/mac
set statusline+=\ %-14.(%l:%c%V%)\ %P\                     " line:col virt-col percent

" Indent-based folding is expensive on big YAML/Markdown files. Default to
" manual globally; ftplugins enable smarter methods per language.
set foldmethod=manual
set foldlevelstart=99
set foldnestmax=10
