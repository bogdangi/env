autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
set expandtab
set number

filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                      " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'                    " Project and file navigation

"------------------=== Other ===----------------------
Plugin 'altercation/vim-colors-solarized'       " Solarized schema
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'                 " Show changed lines

"--------------=== Snippets support ===---------------
Plugin 'honza/vim-snippets'                     " snippets repo

call vundle#end()                               " required

syntax on
filetype on
filetype plugin on
filetype plugin indent on

set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'

" Scrolling
set scrolloff=5

" Main theme
set background=light
colorscheme solarized
