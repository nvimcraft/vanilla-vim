" Search
nnoremap <silent> <leader>cs :nohlsearch<CR>

" Tabs
nnoremap <silent> <leader>tn :tabnew<CR>
nnoremap <silent> <leader>to :tabonly<CR>
nnoremap <silent> <leader>tc :tabclose<CR>
nnoremap <silent> <leader>tm :tabmove<Space>

" Move lines up/down
" <silent> + 'e' flag on :move suppress noise on top/bottom-of-buffer.
nnoremap <silent> <leader>j :move .+1<CR>==
nnoremap <silent> <leader>k :move .-2<CR>==
xnoremap <silent> <leader>j :move '>+1<CR>gv=gv
xnoremap <silent> <leader>k :move '<-2<CR>gv=gv

" Utility toggles (autoload-backed)
nnoremap <silent> <leader>nr :call utils#ToggleRelativeNumbers()<CR>
nnoremap <silent> <leader>tp :call utils#TogglePaste()<CR>
nnoremap <silent> <leader>fi :call utils#FileInfo()<CR>

" Reload config without restarting (useful while iterating).
nnoremap <silent> <leader>vr :source $MYVIMRC<CR>:echo 'vimrc reloaded'<CR>

" Quick-save / quick-quit. Use ZZ for save-and-quit (built-in).
nnoremap <silent> <leader>w :write<CR>
