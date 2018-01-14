if exists("b:nim_loaded")
  finish
endif

let b:nim_loaded = 1

let s:cpo_save = &cpo
set cpo&vim

call nim#init()

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=:##,:#
setlocal commentstring=#\ %s
setlocal omnifunc=NimComplete
setlocal suffixesadd=.nim 
setlocal expandtab  "Make sure that only spaces are used

setl tabstop=2
setl softtabstop=2
setl shiftwidth=2

command! -buffer NimLog :e log://nim
command! -buffer NimTerminateService
  \ :exe printf("%s nimTerminateService('%s')", s:py_cmd, b:nim_project_root)
command! -buffer NimRestartService
  \ :exe printf("%s nimRestartService('%s')", s:py_cmd, b:nim_project_root)

compiler nim

let &cpo = s:cpo_save
unlet s:cpo_save

