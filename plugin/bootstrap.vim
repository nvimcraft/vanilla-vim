vim9script

var plugin_dir = expand('~/.vim/plugged')

def Ensure(repo: string)
  var name = split(repo, '/')[-1]
  var path = plugin_dir .. '/' .. name

  if !isdirectory(path)
    if !isdirectory(plugin_dir)
      mkdir(plugin_dir, 'p')
    endif
    execute '!git clone --depth=1 https://github.com/' .. repo .. ' ' .. shellescape(path)
  endif

  execute 'set runtimepath+=' .. fnameescape(path)
enddef
