" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data'). '/plugged')
" Intelli-sense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'

Plug 'andrejlevkovitch/vim-lua-format'
Plug 'tpope/vim-surround'

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" cht.sh integration
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

" Syntax highlighting
Plug 'chr4/nginx.vim'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
call plug#end()

