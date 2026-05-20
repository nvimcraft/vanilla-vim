vim9script

# Files
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fq :CList<CR> 
nnoremap <leader>fH :Helptags<CR>

# Grep current string
nnoremap <leader>fs :Rg <C-r><C-w><CR>

# Grep input string
nnoremap <leader>fg :Rg<Space>

# Grep for current file name
nnoremap <leader>fc :execute 'Rg ' .. expand('%:t:r')<CR>

# Find files in your Vim config
nnoremap <leader>fv :Files ~/.vim<CR>
