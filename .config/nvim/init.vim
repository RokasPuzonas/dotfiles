source ~/.config/nvim/vim-plug/plugins.vim
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/autocmds.vim
source ~/.config/nvim/keys/mappings.vim
source ~/.config/nvim/keys/which-key.vim

source ~/.config/nvim/themes/gruvbox.vim

" Auto source all file in /plugin-config
for f in split(glob('~/.config/nvim/plugin-config/*.vim'), '\n')
    exe 'source' f
endfor

