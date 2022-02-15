call plug#begin('~/.vim/plugged')

Plug 'yggdroot/indentline'
Plug 'junegunn/vader.vim'
Plug 'tpope/vim-sensible'
Plug 'vim-perl/vim-perl'
Plug 'PProvost/vim-ps1'
Plug 'janko-m/vim-test'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline'
Plug 'kshenoy/vim-signature'

call plug#end()

" --- APPEARANCE START ---

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

" highlight unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" indentLine plugin config
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_showFirstIndentLevel = 1
" disabling for json
" see: https://github.com/Yggdroot/indentLine/issues/172#issuecomment-918371130
autocmd Filetype json let g:indentLine_setConceal = 0

" --- APPEARANCE END ---

" --- FORMATTING START ---

set encoding=utf-8

" default indentation
set expandtab
set number
set shiftwidth=2
set smarttab
set softtabstop=0
set tabstop=4

" indentation for specific file types
autocmd FileType bats set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType cs set tabstop=4|set softtabstop=4|set shiftwidth=4 expandtab
autocmd FileType go set tabstop=8|set shiftwidth=0|set noexpandtab
autocmd FileType groovy set tabstop=4|set softtabstop=4|set shiftwidth=4 expandtab
autocmd FileType html set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType java set tabstop=4|set softtabstop=4|set shiftwidth=4 expandtab
autocmd FileType sh set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType xml set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType xhtml set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType yaml set tabstop=2|set softtabstop=2|set shiftwidth=2 expandtab
autocmd FileType py set tabstop=4|set softtabstop=4|set shiftwidth=4 expandtab

" syntastic
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['golangci_lint']
let g:syntastic_java_checkers = []
let g:syntastic_sh_shellcheck_args = "-x"
let g:syntastic_python_checkers = ['pylint']

" --- FORMATTING END ---

" --- MISC START ---

" nerdtree
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" WSL yank support
" https://superuser.com/a/1557751
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" --- MISC END ---

" --- LATE LOADING START ---

" :Bwipeout[!]
" wipe all deleted/unloaded buffers
" see: https://vi.stackexchange.com/a/27105
command! -bar -bang Bwipeout call misc#bwipeout(<bang>0)

" --- LATE LOADING END ---
