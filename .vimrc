syntax on
set number
set ls=2
highlight LineNr ctermfg=darkgrey
highlight NonText ctermfg=darkgrey
highlight StatusLine ctermfg=150

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

map <C-p> :w<CR>:!python3 %<CR>
set backspace=2

set clipboard=unnamed
set noswapfile
set hlsearch
