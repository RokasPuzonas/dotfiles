let mapleader=" "
" let localleader=" "

" Disable Ex-mode
map Q <Nop>

" Toggle whitespace characters
nnoremap <leader>ws :set list!<CR>

" Easier movement between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-w>h <nop>
nnoremap <C-w>j <nop>
nnoremap <C-w>k <nop>
nnoremap <C-w>l <nop>

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Edit current config file
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
" Reload current config file
nnoremap <leader>sv :source $MYVIMRC<CR>

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>
" Alternate way to quit
nnoremap <silent> <C-Q> :wq!<CR>

" Unbind arrow key for learning to use hjkl
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>
