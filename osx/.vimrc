" ### GENERAL SETTINGS ###
" colors
syntax on " turn syntax highlighting on
colorscheme fruchtig " use selected colorscheme

" clipboard
set clipboard=unnamed " attach to os clipboard

" backspace
set backspace=2 " make backspace work like most other programs

" tabs and spaces
filetype plugin indent on
set expandtab " on pressing tab, insert two spaces
set tabstop=2 " show existing tab with two spaces width
set softtabstop=2
set shiftwidth=2 " when indenting with '>' key, use 2 spaces

" vimplug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'PProvost/vim-ps1'
Plug 'janko-m/vim-test'
Plug 'krisajenkins/vim-projectlocal'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-git'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'thinca/vim-prettyprint'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'OmniSharp/omnisharp-vim'

call plug#end()
