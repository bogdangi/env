# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
wget https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim -O ~/.vim/autoload/pathogen.vim 

# Setup fugitive
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git

# Setup colors-solarized
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git

# Set vimrc
cp vimrc ~/.vimrc
