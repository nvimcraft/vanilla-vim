" Toggle search highlight
function! utils#ToggleSearchHighlight()
  if &hlsearch
    set nohlsearch
  else
    set hlsearch
  endif
endfunction

" Toggle relative numbers
function! utils#ToggleRelativeNumbers()
  if &relativenumber
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction

" Toggle paste mode
function! utils#TogglePaste()
  if &paste
    set nopaste
    echo 'Paste mode: OFF'
  else
    set paste
    echo 'Paste mode: ON'
  endif
endfunction

" Quick file info
function! utils#FileInfo()
  echo 'File: ' . expand('%:p')
  echo 'Type: ' . &filetype
  echo 'Encoding: ' . &fileencoding
  echo 'Format: ' . &fileformat
  echo 'Lines: ' . line('$')
endfunction
