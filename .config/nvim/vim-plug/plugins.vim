" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data'). '/plugged')
" Keybind cheat sheet
Plug 'liuchengxu/vim-which-key'

" Intelli-sense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy file finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'

Plug 'andrejlevkovitch/vim-lua-format'
Plug 'tpope/vim-surround'

" Discord presence
" Plug 'vimsence/vimsence'

" Better commenting
Plug 'tpope/vim-commentary'

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Pretty statusline
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" File tree
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

" cht.sh integration
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

" Integrated testing
Plug 'geekjuice/vim-mocha'

" Syntax highlighting
Plug 'chr4/nginx.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
call plug#end()

