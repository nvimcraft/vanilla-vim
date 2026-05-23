vim9script

import '../autoload/utils.vim'

# Clear highlight search
nnoremap <leader>cs :nohlsearch<CR>

# Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove

# Move lines up/down
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

# Utility toggles
nnoremap <leader>nr <ScriptCmd>utils.ToggleRelativeNumbers()<CR>
nnoremap <leader>tp <ScriptCmd>utils.TogglePaste()<CR>
nnoremap <leader>fi <ScriptCmd>utils.FileInfo()<CR>

# FZF mappings
nnoremap <leader>ff <Cmd>Files<CR> 
nnoremap <leader>fb <Cmd>Buffers<CR> 
nnoremap <leader>fg <Cmd>Rg<CR> 
nnoremap <leader>fH <Cmd>Helptags<CR> 
nnoremap <leader>gs :G<CR>
nnoremap <leader>gb :G blame<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gl :G log<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gu :Gread<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gp :G push<CR>

# GitGutter mappings
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
nmap <Leader>hS <Plug>(GitGutterStageAll)

# LSP navigation
nnoremap gd <ScriptCmd>utils.GotoDefinition()<CR>
nnoremap gD <Cmd>LspGotoDeclaration<CR>
nnoremap gi <Cmd>LspGotoImpl<CR>
nnoremap gI <Cmd>LspPeekDefinition<CR>
nnoremap K <ScriptCmd>utils.Hover()<CR>
nnoremap gr <Cmd>LspShowReferences<CR>
nnoremap grn <Cmd>LspRename<CR>
nnoremap gca <Cmd>LspCodeAction<CR>
nnoremap <leader>ds <Cmd>LspDiag show<CR>
nnoremap [d <Cmd>LspDiag prev<CR>
nnoremap ]d <Cmd>LspDiag next<CR>
nnoremap <leader>fm <ScriptCmd>utils.Format()<CR>
