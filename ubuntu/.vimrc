call plug#begin('~/.vim/plugged')

Plug 'yggdroot/indentline'
Plug 'junegunn/vader.vim'
Plug 'tpope/vim-sensible'
Plug 'vim-perl/vim-perl'
Plug 'PProvost/vim-ps1'
Plug 'janko-m/vim-test'
Plug 'krisajenkins/vim-projectlocal'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'thinca/vim-prettyprint'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kshenoy/vim-signature'

call plug#end()

" WSL yank support
" https://superuser.com/a/1557751
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" onehalf
colorscheme onehalfdark
let g:airlight_theme='onehalfdark'

" mode-based cursor color
if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;#11dd00\x7\<Esc>[1 q"
  let &t_EI = "\<Esc>]12;#cc1111\x7\<Esc>[1 q"
  silent !echo -ne "\033]12;\#cc1111\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]12;\#11dd00\007"
  " use \003]12;gray\007 for gnome-terminal
endif

" indentLine plugin config
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_fileTypeExclude = ['json']

" default indentation
set shiftwidth=2
set softtabstop=0
set tabstop=4
set expandtab
set smarttab
set number

" indentation for specific file types
autocmd FileType sh set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType bats set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType xml set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType html set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType xhtml set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType yaml set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType cs set tabstop=4|set softtabstop=4|set shiftwidth=4 expandtab
autocmd FileType java set tabstop=4|set softtabstop=4|set shiftwidth=4 expandtab
autocmd FileType groovy set tabstop=4|set softtabstop=4|set shiftwidth=4 expandtab

" nerdtree
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" pep8
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=120 |
            \ set expandtab | 
            \ set autoindent |
            \ set fileformat=unix

" using pylint for syntastic
let g:syntastic_python_checkers = ['pylint']

" unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" go
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']

" shellcheck
let g:syntastic_sh_shellcheck_args = "-x"
