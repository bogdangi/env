" <F8> File encoding for open
" ucs-2le - MS Windows unicode encoding
map <F8>	:execute RotateEnc()<CR>
vmap <F8>	<C-C><F8>
imap <F8>	<C-O><F8>
let b:encindex=0
function! RotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":e ++enc=".str
    endif
  endwhile
endfunction

syntax on
filetype plugin indent on

" Set 4 spaces on tab
set tabstop=4
set shiftwidth=4
set expandtab
set number

" Set syntax
au BufNewFile,BufRead *.zcml set filetype=xml
au BufNewFile,BufRead *.robot set filetype=robot

" No newline at end of file
set fileformats+=dos


set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'      " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'            " Project and file navigation
Plugin 'majutsushi/tagbar'              " Class/module browser

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/vcscommand.vim'


"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'        " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'   " dependencies #1
Plugin 'tomtom/tlib_vim'        " dependencies #2
Plugin 'honza/vim-snippets'     " snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'           " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'       " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'        " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'vim-scripts/closetag.vim'

call vundle#end()                   " required
filetype on
filetype plugin on
filetype plugin indent on
