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

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Edit current config file
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
" Reload current config file
nnoremap <leader>sv :source $MYVIMRC<CR>

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>
" Alternate way to quit
nnoremap <silent> <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <silent> <C-c> <Esc>

" Remap leaving insert mode from <esc> to jk or kj
inoremap <esc> <nop>
inoremap jk <esc>
inoremap kj <esc>

" Unbind arrow key for learning to use hjkl
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

