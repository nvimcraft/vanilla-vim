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

# LSP go-to-definition with tag fallback
export def GotoDefinition()
  if lsp#lsp#ServerRunning(&filetype)
    LspGotoDefinition
  else
    execute 'tag ' .. expand('<cword>')
  endif
enddef

# LSP hover with keywordprg fallback
export def Hover()
  if lsp#lsp#ServerRunning(&filetype)
    LspHover
  else
    normal! K
  endif
enddef

# Format LSP if available, otherwise native indent
export def Format()
  if lsp#lsp#ServerRunning(&filetype)
    LspFormat
  else
    normal! gg=G
  endif
enddef
