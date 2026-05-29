" -----------------------------------------------------------------------------
" Loaded AFTER all plugins/ftplugins. Holds cross-cutting autocommands so the
" intent is in one place.
" -----------------------------------------------------------------------------

" Filetypes that get trailing-whitespace stripped on save
" Markdown is EXCLUDED: two trailing spaces is CommonMark for <br>.
" Diff/patch are EXCLUDED: trailing space can be meaningful.
" gitcommit is EXCLUDED: leave the user's message alone.

" Written on one line on purpose: line continuation ('\') is disabled when
" 'cpoptions' contains 'C', which happens under -e/ex mode and 'compatible'.
let g:strip_trailing_filetypes = ['javascript', 'typescript', 'json', 'yaml', 'vim', 'sh', 'zsh', 'bash', 'python', 'go', 'rust', 'c', 'cpp', 'lua']

augroup vimrc_autocmds
    autocmd!

    " Highlight yanked text briefly (text-prop based, no shellout).
    autocmd TextYankPost * call s:highlight_yank()

    " Strip trailing whitespace on save -- ONLY for explicit filetypes.
    autocmd BufWritePre * call s:strip_trailing_whitespace()

    " Auto-create parent directory when saving to a new path.
    " Defensive: only acts on real (non-special) paths.
    autocmd BufWritePre * call s:create_parent_dir()

    " Restore cursor to last position in this buffer.
    autocmd BufReadPost * call s:restore_cursor()

    " Spell check on text-style filetypes (extra defensive: gitcommit handled
    " by ftplugin, this catches the rest).
    autocmd FileType text,markdown,tex setlocal spell spelllang=en_us

    " Cursorline only in the active window; cheaper than always-on rendering.
    autocmd InsertEnter * setlocal nocursorline
    autocmd InsertLeave * setlocal cursorline
    autocmd WinLeave    * setlocal nocursorline
    autocmd WinEnter    * setlocal cursorline
augroup END

" Script-local helpers. Kept private to this file so the global namespace
" stays clean.

function! s:highlight_yank() abort
    if !exists('v:event') || get(v:event, 'operator', '') !=# 'y'
        return
    endif
    " Match just the yanked region; clear after ~150ms.
    silent! call clearmatches()
    let l:start = line("'[")
    let l:end   = line("']")
    if l:start < 1 || l:end < 1
        return
    endif
    let l:pat = '\%>' . (l:start - 1) . 'l\%<' . (l:end + 1) . 'l'
    call matchadd('IncSearch', l:pat, 10, -1)
    call timer_start(150, {-> execute('silent! call clearmatches()')})
endfunction

function! s:strip_trailing_whitespace() abort
    if index(g:strip_trailing_filetypes, &filetype) < 0
        return
    endif
    " Skip binary, large, and special buffers.
    if &binary || &buftype !=# ''
        return
    endif
    let l:view = winsaveview()
    silent! keeppatterns %substitute/\s\+$//e
    call winrestview(l:view)
endfunction

function! s:create_parent_dir() abort
    if &buftype !=# ''
        return
    endif
    let l:dir = expand('%:p:h')
    if l:dir !=# '' && !isdirectory(l:dir)
        call mkdir(l:dir, 'p')
    endif
endfunction

function! s:restore_cursor() abort
    let l:lnum = line("'\"")
    if l:lnum >= 1 && l:lnum <= line('$') && &filetype !~# 'commit\|rebase'
        execute 'normal! g`"'
    endif
endfunction
