vim9script

# Toggle search highlight
export def ToggleSearchHighlight()
  if &hlsearch
    set nohlsearch
  else
    set hlsearch
  endif
enddef

# Toggle relative numbers
export def ToggleRelativeNumbers()
  if &relativenumber
    set norelativenumber
    set number
  else
    set relativenumber
  endif
enddef

# Toggle paste mode
export def TogglePaste()
  if &paste
    set nopaste
    echo 'Paste mode: OFF'
  else
    set paste
    echo 'Paste mode: ON'
  endif
enddef

# Quick file info
export def FileInfo()
  echo 'File: ' .. expand('%:p')
  echo 'Type: ' .. &filetype
  echo 'Encoding: ' .. &fileencoding
  echo 'Format: ' .. &fileformat
  echo 'Lines: ' .. line('$')
enddef
