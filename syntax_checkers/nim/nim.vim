" Vim syntastic plugin
" Language:   Nim
"
" See for details on how to add an external Syntastic checker:
" https://github.com/scrooloose/syntastic/wiki/Syntax-Checker-Guide#external
if exists('g:loaded_syntastic_nim_nim_chekcer')
  finish
endif
let g:loaded_syntastic_nim_nim_chekcer = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_nim_nim_GetLocList() dict
  let makeprg = 'nim check --hints:off --listfullpaths ' . nim#current_nim_file()
  let errorformat = &errorformat

  return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endf

function! SyntaxCheckers_nim_nim_IsAvailable() dict
  return executable('nim')
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
      \ 'filetype': 'nim',
      \ 'name': 'nim'})

let &cpo = s:save_cpo
unlet s:save_cpo
