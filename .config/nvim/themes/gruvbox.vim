colorscheme gruvbox
syntax on

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
	set termguicolors
	highlight ColorColumn ctermbg=DarkGray
endif
