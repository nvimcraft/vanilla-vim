vim9script

# Encoding
set encoding=utf-8
set fileencodings=utf-8,latin1

# Line numbers
set number
set relativenumber

# Buffer management
set hidden

# Backup and swap files
set backup
set backupdir=$HOME/.vim/data/backup//
set directory=$HOME/.vim/data/swap//
set writebackup

# Undo configuration
set undofile
set undodir=$HOME/.vim/data/undo//

# Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch

# Performance
set timeoutlen=500
set updatetime=300

# Split windows
set splitbelow
set splitright

# File handling
set autoread

# Mouse support (only in GUI or when TERM supports it)
if has('gui_running') || $TERM =~# 'xterm\|screen\|tmux'
  set mouse=a
endif

# Leader key (must be set early)
g:mapleader = ' '
