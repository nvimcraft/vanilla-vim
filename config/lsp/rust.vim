vim9script

export var server = {
  name: 'rustanalyzer',
  filetype: ['rust'],
  path: 'rust-analyzer',
  args: ['--stdio'],
  syncInit: true,
}
