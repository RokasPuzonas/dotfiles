" Enable syntax highlighting for all files
syntax enable
filetype plugin on

" Display whitespace characters
set listchars=space:.,eol:$,tab:>-

" Load external config in current directory if found
set exrc

set hidden
set nowrap
set noshowmode
set foldmethod=indent

" If possible use 24 Bit Colors
set termguicolors

" Always keep at least 8 blank lines below the last line
set scrolloff=8

" Draw a line on the 80 character mark for reference
set colorcolumn=80

" Display relative and absolute line numbers
set number relativenumber

" Disable those annoying DINGS when you pressing something too much
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
