# Vanilla Vim

Minimal Vim 9 configuration for my work as an Adoption Specialist at Celigo.

This setup is intentionally minimal and optimized for quick inspection and
editing of JSON and JavaScript files.

## Structure

```
~/.vim/
├── vimrc                          # Entry point; creates directories, sources modules
├── config/                        # Explicitly-sourced config modules
│   ├── options.vim                # Core behavior: encoding, numbers, search, splits, mouse
│   ├── appearance.vim             # UI/visual: clipboard, colors, status line, folding
│   ├── editing.vim                # Indentation, wrapping, format options
│   └── mappings.vim               # Leader mappings, window/buffer/tab navigation
├── plugin/
│   └── bootstrap.vim              # Plugin loader: auto-clones and adds to runtimepath
├── after/
│   └── plugin/
│       └── autocmds.vim           # Post-plugin autocommands: yank highlight, whitespace, cursor
├── autoload/
│   └── utils.vim                  # On-demand utility functions (toggles, file info)
├── ftplugin/                      # Per-filetype overrides (python, go, js/ts, etc.)
└── data/                          # Runtime artifacts (auto-created)
    ├── backup/
    ├── swap/
    └── undo/
```

## Key mappings

Leader is `<Space>`.

| Mapping           | Action                     |
| ----------------- | -------------------------- |
| `<leader>h/j/k/l` | Window navigation          |
| `<leader>+/-/>/<` | Resize splits              |
| `<leader>=`       | Equalize splits            |
| `<leader>bn`      | Buffer next                |
| `<leader>bp`      | Buffer previous            |
| `<leader>bd`      | Buffer delete              |
| `<leader>bl`      | Buffer list                |
| `<leader>cs`      | Clear search highlight     |
| `<leader>tn`      | Tab new                    |
| `<leader>to`      | Tab only                   |
| `<leader>tc`      | Tab close                  |
| `<leader>tm`      | Tab move                   |
| `<leader>nr`      | Toggle relative numbers    |
| `<leader>tp`      | Toggle paste mode          |
| `<leader>fi`      | Show file info             |
| `<leader>fmt`     | Format file (per-filetype) |
| `Alt-j/k`         | Move line(s) up/down       |

## Formatting

`<leader>fm` is buffer-local, defined per filetype in `ftplugin/`.

| Filetype   | Formatter                   | Fallback |
| ---------- | --------------------------- | -------- |
| Python     | `black`                     | `gg=G`   |
| Go         | `gofmt`                     | `gg=G`   |
| JavaScript | `prettier --stdin-filepath` | `gg=G`   |
| TypeScript | `prettier --stdin-filepath` | `gg=G`   |
| JSON       | `python3 -m json.tool`      | `gg=G`   |
| YAML       | —                           | `gg=G`   |
| HTML       | —                           | `gg=G`   |
| CSS        | —                           | `gg=G`   |
| Markdown   | `gqap` (paragraph)          | —        |
| Vim        | —                           | `gg=G`   |

## Autocommands

| Event          | Action                                        |
| -------------- | --------------------------------------------- |
| `TextYankPost` | Brief highlight on yanked text (150ms)        |
| `BufWritePre`  | Strip trailing whitespace, create parent dirs |
| `BufReadPost`  | Restore cursor position to last edit location |
| `InsertEnter`  | Disable cursorline during insert mode         |
| `InsertLeave`  | Re-enable cursorline after insert mode        |
| `FileType`     | Enable spell check for text/markdown/tex      |
