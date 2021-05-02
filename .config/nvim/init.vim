" Setup XDG friendly folder structure
set viminfo+='1000,n$XDG_DATA_HOME/nvim/viminfo
set runtimepath=$XDG_CONFIG_HOME/nvim,$VIMRUNTIME,$XDG_CONFIG_HOME/nvim/after

call plug#begin(stdpath('data'). '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'chr4/nginx.vim'

Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
call plug#end()

let mapleader=" "

" Auto-commands
fun!TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

augroup PUZONAS
	autocmd!
	autocmd BufWritePre * :call TrimWhitespace()
augroup END

