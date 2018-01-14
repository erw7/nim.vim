if exists('b:did_ftplugin')
  finish
endif

let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

call nim#init()

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=:##,:#
setlocal commentstring=#\ %s
setlocal omnifunc=NimComplete
setlocal suffixesadd=.nim
setlocal expandtab  "Make sure that only spaces are used

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

command! -buffer NimLog :e log://nim
command! -buffer NimTerminateService
  \ :exe printf("%s nimTerminateService('%s')", s:py_cmd, b:nim_project_root)
command! -buffer NimRestartService
  \ :exe printf("%s nimRestartService('%s')", s:py_cmd, b:nim_project_root)

compiler nim

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
else
  let b:undo_ftplugin .= ' | '
endif
let b:undo_ftplugin .= '
      \ setl fo< com< ofu< sua< pa< et< ts< sts< sw<
      \ | delc NimLog | delc NimTerminateService | delc NimRestartService
      \ | unl b:did_ftplugin b:nim_project_root b:nim_defined_symbols b:nim_caas_enabled
      \'

let &cpo = s:cpo_save
unlet s:cpo_save

