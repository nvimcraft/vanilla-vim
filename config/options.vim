" Leader key. Set early so subsequent mappings see it.
let mapleader = ' '

" Encoding
" UTF-8 in, UTF-8 out. Latin-1 kept as a tolerant fallback for legacy files.
set encoding=utf-8
set fileencodings=utf-8,latin1
scriptencoding utf-8

" Line numbers
set number
set relativenumber

" Buffers
set hidden               " keep modified buffers around when switching

" Backup / swap / undo
" NOTE: Original config had a bug where 'backupdir' was set twice (the second
" set overrode the first) and 'directory' was never set, so swap files leaked
" into the cwd. This block is the corrected version.

" Trailing '//' tells Vim to encode the full path in the filename so two files
" with the same basename don't collide.
set backup
set writebackup
set backupdir=$HOME/.vim/data/backup//
set directory=$HOME/.vim/data/swap//

set undofile
set undodir=$HOME/.vim/data/undo//

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Timing / responsiveness
" timeoutlen:  how long Vim waits for the next key in a mapping (ms).
" ttimeoutlen: how long Vim waits to disambiguate a key code from <Esc> (ms).
"              Default -1 means "use timeoutlen" -- causes visible Esc lag in
"              Terminal.app. Setting a small explicit value fixes it.
set timeoutlen=500
set ttimeoutlen=10

" updatetime: idle time before swap write and CursorHold autocmds (ms).
" Default 4000 is too lazy; 300 is responsive without thrashing.
set updatetime=300

" Splits
set splitbelow
set splitright

" File handling
set autoread

" Clipboard
" macOS-only: 'unnamed' makes yanks land in the system pasteboard via the
" built-in +clipboard support in /usr/bin/vim. No pbcopy/pbpaste shell-out.
if has('mac') || has('clipboard')
    set clipboard=unnamed
endif

" Netrw (built-in file explorer)
" Reduce passive history retention; keep the explorer usable.
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
