" Autocommands
augroup vimrc_autocmds
  autocmd!

  " Highlight yanked text
  autocmd TextYankPost * call HighlightYank()

  " Strip trailing whitespace on save
  autocmd BufWritePre * call StripTrailingWhitespace()

  " Auto-create directories for new files
  autocmd BufWritePre * call CreateParentDirectory()

  " Restore cursor position on file open
  autocmd BufReadPost * call RestoreCursor()

  " Auto-enable spell check for text files
  autocmd FileType text,markdown,tex setlocal spell spelllang=en_us

  " Highlight current line in insert mode
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline

augroup END

" Highlight yanked text
function! HighlightYank()
  if v:event.operator ==# 'y'
    silent! call clearmatches()
    let pattern = '\%>' . (line("'[") - 1) . 'l\%<' . (line("']") + 1) . 'l'
    call matchadd('IncSearch', pattern, 10, -1)
    call timer_start(150, {-> clearmatches()})
  endif
endfunction

" Strip trailing whitespace
function! StripTrailingWhitespace()
  if &filetype !=# 'binary'
    let save_cursor = getpos('.')
    silent! execute '%s/\\s\\+$//e'
    call setpos('.', save_cursor)
  endif
endfunction

" Create parent directory
function! CreateParentDirectory()
  let dir = expand('%:h')
  if dir !=# '' && !isdirectory(dir)
    call mkdir(dir, 'p')
  endif
endfunction

" Restore cursor position
function! RestoreCursor()
  if line("'\"") >= 1 && line("'\"") <= line('$')
    execute "normal! g`\""
  endif
endfunction
