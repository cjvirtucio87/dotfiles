call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'vim-perl/vim-perl'
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

Plug 'hinrik/color-scheme-literal-tango'
Plug 'nanotech/jellybeans.vim'
Plug 'fatih/vim-go', { 'tag': '*' }

" Typescript
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/vim-dtsm'
Plug 'mhartington/vim-typings'

call plug#end()

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
  colorscheme jellybeans
else 
  colorscheme literal_tango
endif


if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;#11dd00\x7\<Esc>[1 q"
  let &t_EI = "\<Esc>]12;#cc1111\x7\<Esc>[1 q"
  silent !echo -ne "\033]12;\#cc1111\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]12;\#11dd00\007"
  " use \003]12;gray\007 for gnome-terminal
endif

set shiftwidth=4
set softtabstop=0
set tabstop=8
set expandtab
set smarttab
set number

autocmd FileType xml set tabstop=2|set softtabstop=2|set shiftwidth=2
autocmd FileType html set tabstop=2|set softtabstop=2|set shiftwidth=2
autocmd FileType xhtml set tabstop=2|set softtabstop=2|set shiftwidth=2
autocmd FileType yaml set tabstop=2|set softtabstop=2|set shiftwidth=2

nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
nmap <silent> <tab> <C-w><C-w>

" vim-go configuration
let g:go_metalinter_autosave = 1
