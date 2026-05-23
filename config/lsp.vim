vim9script

# LSP server registration
# Servers activate automatically when their binaries are found in $PATH

import './lsp/vtsls.vim' as ts
import './lsp/python.vim' as py
import './lsp/go.vim' as go
import './lsp/rust.vim' as rs
import './lsp/yaml.vim' as yml
import './lsp/json.vim' as json
import './lsp/html.vim' as html
import './lsp/css.vim' as css
import './lsp/markdown.vim' as md

var lspServers: list<dict<any>> = [
  ts.server,
  py.server,
  go.server,
  rs.server,
  yml.server,
  json.server,
  html.server,
  css.server,
  md.server,
]

autocmd User LspSetup call LspAddServer(lspServers)

# Global LSP options
var lspOpts: dict<any> = {
  autoHighlightDiags: true,
  showDiagWithSign: true,
  showDiagInPopup: true,
  showSignature: true,
  semanticHighlight: true,
  showInlayHints: true,
  popupBorder: true,
}
autocmd User LspSetup call LspOptionsSet(lspOpts)
