#!/bin/bash

setup_dir=`pwd`


if [[ `which curl` ]]; then
    download="curl --silent --output"
elif [[ `which wget` ]]; then
    download="wget --quiet --output-document"
fi

echo Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
    $download ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim


# Update all vim's bandels
cd ~/.vim/bundle
for bundle in `ls`
do
	cd $bundle
	echo Update $bundle
	git pull
	cd ..
done
cd $setup_dir

# Setup fugitive
cd ~/.vim/bundle
if ! [ -d "vim-fugitive" ]
then
	git clone git://github.com/tpope/vim-fugitive.git
fi
cd $setup_dir

# Setup snipmate
cd ~/.vim/bundle
if ! [ -d "snipmate" ]
then
	git clone git://github.com/msanders/snipmate.vim.git snipmate
fi
cd snipmate/snippets/
#patch -p0 < $setup_dir/vim-snippets/python.snippets.patch
cd $setup_dir

# Setup VCScommand (git, svn, cvs)
cd ~/.vim/bundle
if ! [ -d "vcscommand" ]
then
	git clone git://github.com/vim-scripts/vcscommand.vim.git vcscommand
fi
cd $setup_dir

# SOLARIZED COLORSCHEME FOR VIM
cd ~/.vim/bundle
if ! [ -d "vim-colors-solarized" ]
then
	git clone git://github.com/altercation/vim-colors-solarized.git vim-colors-solarized
fi

cd ~/.vim/bundle
if ! [ -d "robotframework-vim" ]
then
	git clone git://github.com/mfukar/robotframework-vim.git robotframework-vim
fi

cd ~/.vim/bundle
if ! [ -d "vim-flake8" ]
then
	git clone https://github.com/nvie/vim-flake8.git vim-flake8
fi

cd ~/.vim/bundle
if ! [ -d "syntastic" ]
then
	git clone https://github.com/scrooloose/syntastic.git syntastic
fi

# Set vimrc
ln -sf $setup_dir/vimrc $HOME/.vimrc
