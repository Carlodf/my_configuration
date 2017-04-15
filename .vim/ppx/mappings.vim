" VIM MAPPINGS

let mapleader="\\"
let maplocalleader=","

" fast operations on configuration files
nnoremap <leader>ev :sp $MYVIMRC <cr>
nnoremap <leader>es :sp $PPXSET <cr>
nnoremap <leader>ef :sp $PPXFUN <cr>
nnoremap <leader>em :sp $PPXMAP <cr>
nnoremap <leader>sv :source $MYVIMRC <cr>

" Mapping to train
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap OA <nop>
nnoremap OB <nop>
nnoremap OC <nop>
nnoremap OD <nop>

" clear search highlight
nnoremap <silent> <leader>/ :nohlsearch <cr>

" easier mappings for moving within splits
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
" switch split vertical
nnoremap <leader>ssv <c-w>t<c-w>H
" switch split orizontal
nnoremap <leader>sso <c-w>t<c-w>K

" Open browser with url under cursor
nnoremap <leader>gw :!w3m '<cWORD>' .<CR>
