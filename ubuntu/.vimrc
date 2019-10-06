call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'vim-perl/vim-perl'
Plug 'PProvost/vim-ps1'
Plug 'janko-m/vim-test'
Plug 'krisajenkins/vim-projectlocal'
Plug 'OmniSharp/omnisharp-vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-git'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'thinca/vim-prettyprint'
Plug 'tomasiser/vim-code-dark'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" clipboard register
set clipboard=unnamedplus

" vim-code-dark
set t_Co=256
set t_ut=
colorscheme codedark

" mode-based cursor color
if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;#11dd00\x7\<Esc>[1 q"
  let &t_EI = "\<Esc>]12;#cc1111\x7\<Esc>[1 q"
  silent !echo -ne "\033]12;\#cc1111\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]12;\#11dd00\007"
  " use \003]12;gray\007 for gnome-terminal
endif

" indentation
set shiftwidth=2
set softtabstop=0
set tabstop=4
set expandtab
set smarttab
set number

" indentation for specific file types
autocmd FileType xml set tabstop=2|set softtabstop=2|set shiftwidth=2
autocmd FileType html set tabstop=2|set softtabstop=2|set shiftwidth=2
autocmd FileType xhtml set tabstop=2|set softtabstop=2|set shiftwidth=2
autocmd FileType yaml set tabstop=2|set softtabstop=2|set shiftwidth=2

" nerdtree
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" pep8
" note: 
" - line length set to 120; make sure you add a ${HOME}/.config/flake8
"   file to configure line-length
" - see: https://github.com/nvie/vim-flake8#max-line-lengths
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=120 |
            \ set expandtab | 
            \ set autoindent |
            \ set fileformat=unix

" unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

" OmniSharp-roslyn:
let g:OmniSharp_server_path = '/mnt/c/OmniSharp/OmniSharp.exe'
let g:OmniSharp_translate_cygwin_wsl = 1
let g:OmniSharp_server_stdio = 1
let g:syntastic_cs_checkers = ['code_checker']
let g:OmniSharp_start_server = 0
let g:OmniSharp_timeout = 5

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" go
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
