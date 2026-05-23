vim9script

# Toggle preview window
g:fzf_vim = {
  preview_window: ['hidden,right,70%', 'ctrl-p']
}

# FZF floating window size (70% width/ 80% height)
g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.8 } }

# Highlight group mappings for FZF UI elements
g:fzf_colors = {
    'fg':      ['fg', 'Normal'],
    'bg':      ['bg', 'Normal'],
    'hl':      ['fg', 'Comment'],
    'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    'hl+':     ['fg', 'Statement'],
    'info':    ['fg', 'PreProc'],
    'border':  ['fg', 'Ignore'],
    'prompt':  ['fg', 'Conditional'],
    'pointer': ['fg', 'Exception'],
    'marker':  ['fg', 'Keyword'],
    'spinner': ['fg', 'Label'],
    'header':  ['fg', 'Comment']
}
