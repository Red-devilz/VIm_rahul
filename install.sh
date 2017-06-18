# Copy Vim files to VIMHOME
cp .vim ~/.
cp .vimrc ~/.

# Install Vundle Plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qa!
