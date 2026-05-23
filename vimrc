" Prevent loading twice
if exists('g:loaded_vimrc')
  finish
endif
let g:loaded_vimrc = 1

" Ensure required directories exist
for dir in [$HOME . '/.vim/data/backup', $HOME . '/.vim/data/swap', $HOME . '/.vim/data/undo']
  if !isdirectory(dir)
    call mkdir(dir, 'p')
  endif
endfor

" Core settings
source $HOME/.vim/options.vim

" Filetype detection and plugins
" must be before options that depend on it
filetype on
filetype plugin on
filetype indent on

" Vim options
source $HOME/.vim/appearance.vim

" Editing behavior
source $HOME/.vim/editing.vim

" Key mappings
source $HOME/.vim/mappings.vim
