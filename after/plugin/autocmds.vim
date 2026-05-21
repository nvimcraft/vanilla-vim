vim9script

# Autocommands
augroup vimrc_autocmds
  autocmd!

  # Highlight yanked text
  autocmd TextYankPost * call HighlightYank()

  # Strip trailing whitespace on save
  autocmd BufWritePre * call StripTrailingWhitespace()

  # Auto-create directories for new files
  autocmd BufWritePre * call CreateParentDirectory()

  # Restore cursor position on file open
  autocmd BufReadPost * call RestoreCursor()

  # Auto-enable spell check for text files
  autocmd FileType text,markdown,tex setlocal spell spelllang=en_us

  # Highlight current line in insert mode
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline

augroup END

# Highlight yanked text
def HighlightYank()
  if v:event.operator ==# 'y'
    silent! clearmatches()
    var pattern = '\%>' .. (line("'[") - 1) .. 'l\%<' .. (line("']") + 1) .. 'l'
    matchadd('IncSearch', pattern, 10, -1)
    timer_start(150, (_) => clearmatches())
  endif
enddef

# Strip trailing whitespace
def StripTrailingWhitespace()
  if &filetype !=# 'binary'
    var save_cursor = getpos('.')
    silent! execute '%s/\\s\\+$//e'
    setpos('.', save_cursor)
  endif
enddef

# Create parent directory
def CreateParentDirectory()
  var dir = expand('%:h')
  if dir !=# '' && !isdirectory(dir)
    mkdir(dir, 'p')
  endif
enddef

# Restore cursor position
def RestoreCursor()
  if line("'\"") >= 1 && line("'\"") <= line('$')
    execute "normal! g`\""
  endif
enddef
