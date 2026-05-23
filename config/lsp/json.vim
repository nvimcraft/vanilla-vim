vim9script

export var server = {
  name: 'jsonls',
  filetype: 'json',
  path: 'vscode-json-language-server',
  args: ['--stdio'],
  initializationOptions: {
    provideFormatter: true,
  },
}
