vim9script

import '../autoload/utils.vim'

# Search
nnoremap <leader>cs :nohlsearch<CR>

# Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove

# Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

# Utility toggles
nnoremap <leader>nr <ScriptCmd>utils.ToggleRelativeNumbers()<CR>
nnoremap <leader>tp <ScriptCmd>utils.TogglePaste()<CR>
nnoremap <leader>fi <ScriptCmd>utils.FileInfo()<CR>

# FZF mappings
nnoremap <leader>ff <Cmd>Files<CR> 
nnoremap <leader>fb <Cmd>Buffers<CR> 
nnoremap <leader>fg <Cmd>Rg<CR> 
nnoremap <leader>fH <Cmd>Helptags<CR> 
