" General
syntax enable
filetype plugin on
set exrc
set hidden
set nowrap
set showmode
set termguicolors
set scrolloff=8
set colorcolumn=80

" Display relative and absolute line numbers
set nu rnu

" Disable those annoying DINGS when you press TAB too much
set noerrorbells

" Always use system clipboard
set clipboard+=unnamedplus

" History
set nobackup
set noswapfile
set undodir=$XDG_DATA_HOME/nvim/undo

" Tab settings
set tabstop=2 softtabstop=2
set shiftwidth=2
set noexpandtab
set smartindent

" Better Searching
set nohlsearch
set incsearch
