setup_dir=`pwd`

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
wget https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim -O ~/.vim/autoload/pathogen.vim 

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
cd $setup_dir

# Setup VCScommand (git, svn, cvs)
cd ~/.vim/bundle
if ! [ -d "vcscommand" ]
then
	git clone git://github.com/vim-scripts/vcscommand.vim.git vcscommand
fi
cd $setup_dir

# Set vimrc
cd $setup_dir
cp vimrc ~/.vimrc
