" -----------------------------------------------------------------------------
" Functions named utils#Foo() are only loaded the first time they are called.
" Bare-name functions (Foo()) WILL NOT auto-load and were the cause of the
" original config's <leader>nr/tp/fi failures.
"
" Removed from the original: GotoDefinition / Hover / Format. Those referenced
" vim-lsp commands; no LSP plugin is installed, so the functions were dead
" code that would throw E117 if anyone tried them.
" -----------------------------------------------------------------------------

function! utils#ToggleRelativeNumbers() abort
    if &relativenumber
        setlocal norelativenumber
        setlocal number
        echo 'numbers: absolute'
    else
        setlocal relativenumber
        echo 'numbers: relative'
    endif
endfunction

function! utils#TogglePaste() abort
    if &paste
        set nopaste
        echo 'paste: OFF'
    else
        set paste
        echo 'paste: ON'
    endif
endfunction

function! utils#FileInfo() abort
    echo 'File:     ' . expand('%:p')
    echo 'Type:     ' . &filetype
    echo 'Encoding: ' . (&fileencoding !=# '' ? &fileencoding : &encoding)
    echo 'Format:   ' . &fileformat
    echo 'Lines:    ' . line('$')
    echo 'Bytes:    ' . wordcount().bytes
endfunction

" Defensive prettier-pipe used by ftplugins. Avoids clobbering the buffer when
" prettier exits non-zero (e.g., parse error). Reads stdin/writes stdout so
" the user's pristine on-disk file is never touched.
function! utils#PrettierPipe() abort
    if !executable('prettier')
        normal! gg=G
        return
    endif
    let l:save_view = winsaveview()
    let l:input = join(getline(1, '$'), "\n")
    let l:output = system('prettier --stdin-filepath '
                \ . shellescape(expand('%')), l:input)
    if v:shell_error == 0 && !empty(l:output)
        silent %delete _
        call setline(1, split(l:output, "\n"))
    else
        echohl WarningMsg
        echo 'prettier failed (exit ' . v:shell_error . '); buffer unchanged'
        echohl None
    endif
    call winrestview(l:save_view)
endfunction

" Defensive jq-pipe for JSON, same pattern.
function! utils#JqPipe() abort
    if !executable('jq')
        normal! gg=G
        return
    endif
    let l:save_view = winsaveview()
    let l:input = join(getline(1, '$'), "\n")
    let l:output = system('jq .', l:input)
    if v:shell_error == 0 && !empty(l:output)
        silent %delete _
        call setline(1, split(l:output, "\n"))
    else
        echohl WarningMsg
        echo 'jq failed (exit ' . v:shell_error . '); buffer unchanged'
        echohl None
    endif
    call winrestview(l:save_view)
endfunction
