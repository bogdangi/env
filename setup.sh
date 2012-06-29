setup_dir=`pwd`

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
    curl -so ~/.vim/autoload/pathogen.vim \
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


# Set vimrc
ln -s $setup_dir/vimrc ~/.vimrc
