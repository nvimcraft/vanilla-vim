# dotvim

Minimal Vim configuration for my work as an Adoption Specialist at Celigo.

> **NOTE:** The complete `vim9script` setup lives on the
> `dev` branch. This branch `main` uses legacy VimScript for
> compatibility with older Vim versions.

## Structure

```
~/.vim/
├── vimrc                          # Entry point; creates directories, sources modules
├── options.vim                    # Core behavior: encoding, numbers, search, splits, mouse
├── appearance.vim                 # UI/visual: clipboard, colors, status line, folding
├── editing.vim                    # Indentation, wrapping, format options
├── mappings.vim                   # Leader mappings, window/buffer/tab navigation
├── .netrwhist                     # netrw history (auto-generated)
├── after/
│   └── plugin/autocmds.vim        # Autocommands: yank highlight, whitespace strip, cursor restore
├── autoload/
│   └── utils.vim                  # On-demand utility functions (toggles, file info)
├── ftplugin/                      # Per-filetype overrides (python, go, js/ts, etc.)
└── data/
    ├── backup/                    # Backup files (auto-created)
    ├── swap/                      # Swap files (auto-created)
    └── undo/                      # Persistent undo (auto-created)
```

## Key mappings

| Mapping             | Action                          |
|---------------------|---------------------------------|
| `<leader>h/j/k/l`   | Window navigation               |
| `<leader>+/-/>/<`   | Resize splits                   |
| `<leader>=`         | Equalize splits                 |
| `<leader>bn`        | Buffer next                     |
| `<leader>bp`        | Buffer previous                 |
| `<leader>bd`        | Buffer delete                   |
| `<leader>bl`        | Buffer list                     |
| `<leader>cs`        | Clear search highlight          |
| `<leader>tn`        | Tab new                         |
| `<leader>to`        | Tab only                        |
| `<leader>tc`        | Tab close                       |
| `<leader>tm`        | Tab move                        |
| `<leader>nr`        | Toggle relative numbers         |
| `<leader>tp`        | Toggle paste mode               |
| `<leader>fi`        | Show file info                  |
| `<leader>fm`        | Format file (per-filetype)      |
| `Alt-j/k`           | Move line(s) up/down            |

## Formatting

`<leader>fm` is buffer-local, defined per filetype in `ftplugin/`.

| Filetype   | Formatter                   | Fallback |
|------------|-----------------------------|----------|
| Python     | `black`                     | `gg=G`   |
| Go         | `gofmt`                     | `gg=G`   |
| JavaScript | `prettier --stdin-filepath` | `gg=G`   |
| TypeScript | `prettier --stdin-filepath` | `gg=G`   |
| JSON       | `python3 -m json.tool`      | `gg=G`   |
| Markdown   | `prettier --stdin-filepath` | `gg=G`   |
| YAML       | `prettier --stdin-filepath` | `gg=G`   |
| Vim        | —                           | `gg=G`   |

## Autocommands

| Event           | Action                                          |
|-----------------|-------------------------------------------------|
| `TextYankPost`  | Brief highlight on yanked text (150ms)          |
| `BufWritePre`   | Strip trailing whitespace, create parent dirs   |
| `BufReadPost`   | Restore cursor position to last edit location   |
| `InsertEnter`   | Disable cursorline during insert mode           |
| `InsertLeave`   | Re-enable cursorline after insert mode          |
| `FileType`      | Enable spell check for text/markdown/tex        |
