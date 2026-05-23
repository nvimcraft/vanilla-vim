vim9script

export var server = {
  name: 'pyright',
  filetype: 'python',
  path: 'pyright-langserver',
  args: ['--stdio'],
  workspaceConfig: {
    python: {
      pythonPath: '/opt/homebrew/bin/python3',
    },
  },
}
