vim9script

# Prevent loading twice
if exists('g:loaded_vimrc')
  finish
endif
g:loaded_vimrc = true

# Ensure required directories exist
for dir in [$HOME .. '/.vim/data/backup', $HOME .. '/.vim/data/swap', $HOME .. '/.vim/data/undo']
  if !isdirectory(dir)
    mkdir(dir, 'p')
  endif
endfor

# Core settings
source $HOME/.vim/config/options.vim

# Filetype detection and plugins
# must be before options that depend on it
filetype on
filetype plugin on
filetype indent on

# Vim options
source $HOME/.vim/config/appearance.vim

# Editing behavior
source $HOME/.vim/config/editing.vim

# Key mappings
source $HOME/.vim/config/mappings.vim

# LSP configuration
source $HOME/.vim/config/lsp.vim
