autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType json setlocal shiftwidth=4 tabstop=4
set expandtab
set number

filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'                    " Project and file navigation

"------------------=== Other ===----------------------
Plugin 'altercation/vim-colors-solarized'       " Solarized schema
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'

call vundle#end()                               " required

syntax on
filetype on
filetype plugin on
filetype plugin indent on

set laststatus=2
set encoding=utf-8
set t_Co=256

" Scrolling
set scrolloff=5

" Main theme
set background=light
colorscheme solarized


" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" nerdtree
let NERDTreeShowHidden=1
