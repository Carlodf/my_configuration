" VIM FUNCTIONS

" Auto toggle paste mode, the insert mode mapping is somehow part of the
" automation trick, it is not meant to be actually manually typed
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
